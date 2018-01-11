require_relative 'tile'
require_relative '../objects/scale'

class ScaleTile < Tile
    attr_reader :scale

    def initialize(length)
        super(length, 0)

        @scale = Scale.new
    end

    def tick
        scale.tick
    end
end
