require_relative 'tickable'

class Robot < Tickable
    attr_reader :speed, :alliance, :ai, :has_block, :current_y, :current_x, :future_y, :future_x
    attr_accessor :tile

    def initialize(ai, speed, x, y)
        @ai = ai
        @speed = speed
        @has_block = false
        @current_x = x
        @future_x = x
        @current_y = y
        @future_y = y

        @ai.attach_robot(self)
    end

    def assign_alliance(alliance)
        @alliance = alliance
    end

    def drive_x(x)
        if x > 1 or x < -1
            return
        end

        future_x += x
    end

    def drive_y(y)
        if y > 1 or y < -1
            return
        end

        future_y += y
    end

    def pickup_block
        if has_block
            return # can't pickup more than one block
        end

        has_block = true # TODO: Check for block
    end

    def tick
        
    end
end