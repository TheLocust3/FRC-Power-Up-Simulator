require_relative 'tile'
require_relative '../objects/scale'

class ScaleTile < Tile
    attr_reader :scale

    def initialize(blue_alliance, red_alliance)
        super(10, 0)

        @scale = Scale.new(blue_alliance, red_alliance)
    end

    def tick
        scale.tick
    end
end
