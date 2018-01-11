require_relative '../tickable'

class Tile < Tickable
    attr_reader :length

    def initialize(length)
        @length = length
    end

    def compute_crossing_time(speed)
        length / speed
    end

    def tick
        
    end
end
