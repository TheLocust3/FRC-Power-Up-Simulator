require_relative 'robot'
require_relative 'alliance'
require_relative 'map'

class Game

    def initialize(blue_ai, red_ai)
        initialize_alliances(blue_ai, red_ai)
        
        @map = Map.new(@blue_alliance, @red_alliance)
    end

    def initialize_alliances(blue_ai, red_ai)
        blue_robots = []
        for ai in blue_ai
            blue_robots << Robot.new(ai, 10)
        end

        red_robots = []
        for ai in red_ai
            red_robots << Robot.new(ai, 10)
        end

        @blue_alliance = Alliance.new('BLUE', blue_robots)
        @red_alliance = Alliance.new('RED', red_robots)
    end

    def run_round
        @map.tick

        for robot in @blue_alliance.robots
            robot.ai.take_turn
        end

        for robot in @red_alliance.robots
            robot.ai.take_turn
        end
    end
end