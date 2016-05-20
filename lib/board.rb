class Board
  def initialize
  end

  def print_board g
    puts "
                    _______________
                    |  ----------- |
                    | |            #{g >= 1 ? "()" : "  "}
                    | |           #{g >= 3 ? "\\" : " "}#{g >= 2 ? "|" : " "}#{g >= 4 ? "/" : " "}
       _____________| |______      #{g >= 5 ? "|" : " "}
      /             | |     /|    #{g >= 6 ? "/" : " "} #{g >= 7 ? "\\" : " "}
     /              | |    / |
    /_____________________/ /
    |_____________________|/
    "
  end
end