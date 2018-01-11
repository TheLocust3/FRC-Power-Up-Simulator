require_relative 'field_object'

class Switch < FieldObject
    attr_reader :alliance_blocks, :non_alliance_blocks, :is_owned_by_alliance

    def initialize(alliance)
        super(alliance)

        @owned_by_alliance = false
        @alliance_blocks = 0
        @non_alliance_blocks = 0
    end

    def add_block(alliance)
        if @alliance == alliance
            alliance_blocks += 1
        else
            non_alliance_blocks += 1
        end
    end

    def tick
        is_owned_by_alliance = false
        if alliance_blocks > non_alliance_blocks
            is_owned_by_alliance = true
        end
    end
end