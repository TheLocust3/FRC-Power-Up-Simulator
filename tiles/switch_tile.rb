require_relative 'tile'
require_relative '../objects/switch'

class SwitchTile < Tile
    attr_reader :switch

    def initialize(alliance, length)
        super(length)

        @switch = Switch.new(alliance)
    end
end
