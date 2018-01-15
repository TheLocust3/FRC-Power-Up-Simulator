require_relative 'field_object'

class ClimbingBar < FieldObject
    attr_reader :robots

    def initialize(alliance)
        super(alliance)

        @robots = 0
    end

    def climb
        if @robots >= 2
            return -1
        end

        @robots += 1
        10
    end

    def tick
    end
end