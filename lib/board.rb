class Board
  def initialize
  end

  # Arguments: integer number of wrong guesses
  # Displays dynamic hangman graphic, based on argument
  def print_board g
    puts "
                    _______________
                    |  ----------- |
                    | |            #{g >= 1 ? "()" : "  "}
                    | |           #{g >= 4 ? "\\" : " "}#{g >= 2 ? "|" : " "}#{g >= 5 ? "/" : " "}
       _____________| |______      #{g >= 3 ? "|" : " "}
      /             | |     /|    #{g >= 6 ? "/" : " "} #{g >= 7 ? "\\" : " "}
     /              | |    / |
    /_____________________/ /
    |_____________________|/
    "
  end
end