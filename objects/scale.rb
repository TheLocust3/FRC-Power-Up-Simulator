require_relative 'field_object'
require_relative '../game'

class Scale < FieldObject
    attr_reader :blue_alliance, :red_alliance, :blue_alliance_blocks, :red_alliance_blocks, :is_owned_by_blue, :is_owned_by_red

    def initialize(blue_alliance, red_alliance)
        super(nil)

        @blue_alliance = blue_alliance
        @red_alliance = red_alliance
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
        elsif @red_alliance_blocks < @blue_alliance_blocks
            @is_owned_by_blue = false
            @is_owned_by_red = true
        end

        if @is_owned_by_blue
            @blue_alliance.score += Game.get_scale_points
        elsif @is_owned_by_red
            @red_alliance.score += Game.get_scale_points
        end
    end
end