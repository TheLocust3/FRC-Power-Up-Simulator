require_relative 'tile'
require_relative '../objects/exchange'

class ExchangeTile < Tile
    attr_reader :exchange

    def initialize(alliance, length)
        super(length, 10)

        @exchange = Exchange.new(alliance)
    end

    def tick
        exchange.tick
    end
end
