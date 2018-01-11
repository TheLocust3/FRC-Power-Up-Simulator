require_relative 'tiles/tile'
require_relative 'tiles/portal_tile'
require_relative 'tiles/exchange_tile'
require_relative 'tiles/switch_tile'
require_relative 'tiles/scale_tile'

class Map
    attr_reader :tiles

    def initialize(blue_alliance, red_alliance)
        @blue_alliance = blue_alliance
        @red_alliance = red_alliance

        initialize_tiles
    end

    def initialize_tiles
        tile = [[]]

        tile << [PortalTile.new(@blue_alliance, 10), ExchangeTile.new(@red_alliance, 10), PortalTile.new(@blue_alliance, 10)]
        tile << [SwitchTile.new(@red_alliance, 10), nil, SwitchTile.new(@red_alliance, 10)]
        tile << [Tile.new(10), Tile.new(10), Tile.new(10)]
        tile << [ScaleTile.new(10), nil, ScaleTile.new(10)]
        tile << [Tile.new(10), Tile.new(10), Tile.new(10)]
        tile << [SwitchTile.new(@blue_alliance, 10), nil, SwitchTile.new(@blue_alliance, 10)]
        tile << [PortalTile.new(@red_alliance, 10), ExchangeTile.new(@blue_alliance, 10), PortalTile.new(@red_alliance, 10)]
    end
end