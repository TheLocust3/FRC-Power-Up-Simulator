require_relative 'tiles/tile'
require_relative 'tiles/portal_tile'
require_relative 'tiles/exchange_tile'
require_relative 'tiles/switch_tile'
require_relative 'tiles/scale_tile'
require_relative 'tickable'

class Map < Tickable
    attr_reader :tiles

    def initialize(blue_alliance, red_alliance)
        @blue_alliance = blue_alliance
        @red_alliance = red_alliance

        initialize_tiles
    end

    def initialize_tiles
        @tiles = []

        @tiles << [PortalTile.new(@blue_alliance, 10), ExchangeTile.new(@red_alliance, 10), PortalTile.new(@blue_alliance, 10)]
        @tiles << [SwitchTile.new(@red_alliance, 10), nil, SwitchTile.new(@red_alliance, 10)]
        @tiles << [Tile.new(10, 0), Tile.new(10, 6), Tile.new(10, 0)]
        @tiles << [ScaleTile.new(10), nil, ScaleTile.new(10)]
        @tiles << [Tile.new(10, 0), Tile.new(10, 6), Tile.new(10, 0)]
        @tiles << [SwitchTile.new(@blue_alliance, 10), nil, SwitchTile.new(@blue_alliance, 10)]
        @tiles << [PortalTile.new(@red_alliance, 10), ExchangeTile.new(@blue_alliance, 10), PortalTile.new(@red_alliance, 10)]
    end

    def tick
        for row in tiles
            for tile in row
                unless tile.nil?
                    tile.tick
                end
            end
        end

        for robot in @blue_alliance.robots
            robot.tick
            robot.tile = @tiles[robot.current_y][robot.current_x]
        end

        for robot in @red_alliance.robots
            robot.tick
            robot.tile = @tiles[robot.current_y][robot.current_x]
        end
    end
end
