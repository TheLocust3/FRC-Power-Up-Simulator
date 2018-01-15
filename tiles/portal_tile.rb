require_relative 'tile'
require_relative '../objects/portal'

class PortalTile < Tile
    attr_reader :portal

    def initialize(alliance, blocks)
        super(10, blocks)

        @portal = Portal.new(alliance)
    end

    def tick
        portal.tick
    end
end
