require_relative 'tile'
require_relative '../objects/portal'

class PortalTile < Tile
    attr_reader :portal

    def initialize(alliance, length)
        super(length)

        @portal = Portal.new(alliance)
    end
end
