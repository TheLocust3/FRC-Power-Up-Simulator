require_relative 'tile'
require_relative '../objects/scale'

class ScaleTile < Tile
    attr_reader :scale

    def initialize(length)
        super(length)

        @scale = Scale.new
    end
end
