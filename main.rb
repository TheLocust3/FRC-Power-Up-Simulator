require_relative 'game'
require_relative 'ai'

blue_ai = [AI.new, AI.new, AI.new]
red_ai = [AI.new, AI.new, AI.new]

game = Game.new(blue_ai, red_ai)
game.run_round
