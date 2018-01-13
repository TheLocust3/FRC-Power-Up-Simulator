class Alliance
    attr_reader :color, :robots
    attr_accessor :score

    def initialize(color, robots)
        @color = color

        setup_robots(robots)
    end

    def setup_robots(robots)
        @robots = robots

        for robot in @robots
            robot.assign_alliance(self)
        end
    end
end