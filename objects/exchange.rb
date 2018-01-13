require_relative 'field_object'

class Exchange < FieldObject
    def initialize(alliance)
        super(alliance)
    end

    def add_block
        @alliance.score += 5

        # TOOD: Add vault
    end

    def tick
    end
end