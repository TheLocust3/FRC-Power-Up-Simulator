require_relative 'tile'
require_relative '../objects/climbing_bar'

class PlatformTile < Tile
    attr_reader :climbing_bar

    def initialize(alliance)
        super(10, 6)

        @climbing_bar = ClimbingBar.new(alliance)
    end

    def tick
        @climbing_bar.tick
    end
end
