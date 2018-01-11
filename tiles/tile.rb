require_relative '../tickable'

class Tile < Tickable
    attr_reader :length, :blocks

    def initialize(length, blocks)
        @length = length
        @blocks = blocks
    end

    def compute_crossing_time(speed)
        length / speed
    end

    def tick
        
    end
end
