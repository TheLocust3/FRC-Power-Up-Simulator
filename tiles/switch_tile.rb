require_relative 'tile'
require_relative '../objects/switch'

class SwitchTile < Tile
    attr_reader :switch

    def initialize(alliance)
        super(10, 0)

        @switch = Switch.new(alliance)
    end

    def tick
        switch.tick
    end
end
