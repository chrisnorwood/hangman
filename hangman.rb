require_relative 'lib/game'

class Hangman
  def initialize
    game = Game.new
    game.play()
  end
end

Hangman.new