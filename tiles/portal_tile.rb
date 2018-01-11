require_relative 'tile'
require_relative '../objects/portal'

class PortalTile < Tile
    attr_reader :portal

    def initialize(alliance, length)
        super(length, 0)

        @portal = Portal.new(alliance)
    end

    def tick
        portal.tick
    end
end
