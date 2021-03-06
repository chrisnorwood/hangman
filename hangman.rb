require_relative 'string'
require_relative 'lib/game'

class Hangman
  def initialize
    puts "                                                
  /\\  /\\__ _ _ __   __ _ _ __ ___   __ _ _ __  
 / /_/ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\ 
/ __  / (_| | | | | (_| | | | | | | (_| | | | |
\\/ /_/ \\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|
                   |___/                       \n\n".color(:red_text)
    type = prompt

    game = Game.new(type)
    game.play()
  end

  def prompt
    puts "Would you like to play a #{'new'.color(:red_text)} game or #{'load'.color(:red_text)} the last-saved game?"
    input = gets.chomp
    exit if input == 'exit'

    if input == 'new' || input == 'load'
      return input
    else
      puts "Please enter: new , load , OR exit\n\n"
      prompt
    end
  end
end

Hangman.new