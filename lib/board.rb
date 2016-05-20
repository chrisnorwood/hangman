class Board
  def initialize
  end

  # Arguments: integer number of wrong guesses
  # Displays dynamic hangman graphic, based on argument
  def print_board g
    puts "
                    _______________
                    |  ----------- |
                    | |            #{g >= 1 ? "()".color(:yellow_text) : "  "}
                    | |           #{g >= 4 ? "\\".color(:yellow_text) : " "}#{g >= 2 ? "|".color(:yellow_text) : " "}#{g >= 5 ? "/".color(:yellow_text) : " "}
       _____________| |______      #{g >= 3 ? "|".color(:yellow_text) : " "}
      /             | |     /|    #{g >= 6 ? "/".color(:yellow_text) : " "} #{g >= 7 ? "\\".color(:yellow_text) : " "}
     /              | |    / |
    /_____________________/ /
    |_____________________|/
    "
  end
end