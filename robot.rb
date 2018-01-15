require_relative 'tickable'
require_relative 'tiles/platform_tile'
require_relative 'tiles/switch_tile'
require_relative 'tiles/scale_tile'

class Robot < Tickable
    attr_reader :speed, :alliance, :ai, :has_block, :current_y, :current_x, :future_y, :future_x, :ticks_until_cross, :ticks_until_climb, :map
    attr_accessor :tile, :climbing # 0 -> not, 1 -> climbing, 2 -> has climbed

    def initialize(ai, speed, x, y)
        @ai = ai
        @speed = speed
        @has_block = true
        @current_x = x
        @future_x = x
        @current_y = y
        @future_y = y
        @ticks_until_cross = -1
        @ticks_until_climb = -1
        @tile = nil
        @climbing = 0

        @ai.attach_robot(self)
    end

    def assign_alliance(alliance)
        @alliance = alliance
    end

    def attach_map(map) # TODO: Clean this up so map isn't needed
        @map = map
    end

    def drive_x(x)
        if x > 1 or x < -1 or @current_x != @future_x or @current_y != @future_y
            return false
        end

        if @map.tiles[@current_y][@current_x + x]
            return false
        end

        @future_x += x
        true
    end

    def drive_y(y)
        if y > 1 or y < -1 or @current_y != @future_y or @current_x != @future_x
            return false
        end

        if @map.tiles[@current_y + y][@current_x]
            return false
        end

        @future_y += y
        true
    end

    def pickup_block
        if @has_block
            return false
        end

        @has_block = @tile.pickup_block
        true
    end

    def climb
        if @tile.is_a? PlatformTile
            @ticks_until_climb = @tile.climbing_bar.climb

            if @ticks_until_climb > 0
                @climbing = 1
            end
        end
    end

    def place_block
        if @tile.is_a? SwitchTile or @tile.is_a? ScaleTile
            # TODO: Implement this
        end
    end

    def tick
        if @climbing == 1
            if @ticks_until_climb == 0
                @climbing = 2
                @ticks_until_climb = -1
            else
                @ticks_until_climb -= 1
            end
        end

        if @can_move
            return
        end

        if @current_x != @future_x or @current_y != @future_y
            if @ticks_until_cross == 0
                @current_x = @future_x
                @current_y = @future_y
                @ticks_until_cross = -1
            elsif @ticks_until_cross == -1
                @ticks_until_cross = @tile.compute_crossing_time(speed)
            else
                @ticks_until_cross -= 1
            end
        end
    end
    
    private
    def can_move
        if @climbing >= 1
            return false
        end

        true
    end
end