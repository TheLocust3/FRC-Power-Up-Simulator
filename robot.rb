class Robot
    attr_reader :speed, :alliance, :ai, :has_block

    def initialize(ai, speed)
        @ai = ai
        @speed = speed
        @has_block = false

        @ai.attach_robot(self)
    end

    def assign_alliance(alliance)
        @alliance = alliance
    end

    def pickup_block
        if has_block
            return # can't pickup more than one block
        end

        has_block = true # TODO: Check for block
    end
end