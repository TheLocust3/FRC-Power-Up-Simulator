require_relative 'field_object'

class Scale < FieldObject
    attr_reader :blue_alliance_blocks, :red_alliance_blocks, :is_owned_by_blue, :is_owned_by_red

    def initialize()
        super(nil)

        @owned_by_blue = false
        @owned_by_red = false
        @blue_alliance_blocks = 0
        @red_alliance_blocks = 0
    end

    def add_block(alliance)
        if @alliance.color == 'BLUE'
            @blue_alliance_blocks += 1
        else
            @red_alliance_blocks += 1
        end
    end

    def tick
        if @blue_alliance_blocks > @red_alliance_blocks
            @is_owned_by_blue = true
            @is_owned_by_red = false
        else
            @is_owned_by_blue = false
            @is_owned_by_red = true
        end

        if @is_owned_by_blue
            @blue_alliance_blocks.score += 1
        elsif @is_owned_by_red
            @red_alliance_blocks.score += 1
        end
    end
end