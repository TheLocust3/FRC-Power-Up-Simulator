class AI
    attr_reader :robot, :map

    def initialize
        @robot = nil
    end

    def attach_robot(robot)
        @robot = robot
    end

    def attach_map(map)
        @map = map
    end

    def take_turn
        @robot.drive_x(1)        
    end
end