require_relative 'field_object'

class Portal < FieldObject
    attr_reader :portal

    def initialize(alliance)
        super(alliance)

        @blocks = 7
    end

    def add_block
        
    end

    def tick
        
    end
end