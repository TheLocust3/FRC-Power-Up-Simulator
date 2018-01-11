class Robot
    attr_reader :speed, :alliance

    def initialize(ai, speed)
        @ai = ai
        @speed = speed

        @ai.attach_robot(self)
    end

    def assign_alliance(alliance)
        @alliance = alliance
    end
end