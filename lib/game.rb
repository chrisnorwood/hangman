require 'pry-byebug'
require_relative 'board'

class Game
  attr_reader :board, :word, :try, :wrong

  def initialize type=nil
    @board = Board.new

    # Reloads object attributes from save game, or creates new instances
    if type == 'load'
      load
    else
      @word  = sample_word("5desk.txt").downcase
      @try   = []
      @wrong = 0
    end
  end

  def play
    until game_over?
      render_game
      prompt
    end

    if game_over?
      render_game

      puts "You won!" if winner?
      puts "You lost!  The word was: #{@word}" if loser?

      replay_prompt
    end
  end

  def prompt
    puts "Enter a guess, a-z :"

    guess = gets.chomp
    exit if guess == 'exit'
    if guess == 'save'
      save
      print "Saved.\n\n"
      prompt
    end

    if !valid_guess?(guess)
      print "#{guess} is an invalid selection.\n\n"
      prompt
    else
      @try << guess
      if !@word.include?(guess)
        @wrong += 1
        puts "\n\nNice try..."
      else
        puts "You got it!"
      end
      guess
    end
  end

  def load
    data = {}
    File.open('data/save.yaml', 'r') do |f|
      data = YAML.load(f.read)
    end
    @word  = data[:word]
    @try   = data[:try]
    @wrong = data[:wrong]
  end

  def save
    data = {}
    data[:word]  = @word
    data[:try]   = @try
    data[:wrong] = @wrong

    File.open('data/save.yaml', 'w') do |f|
      f.write YAML.dump(data)
    end
    puts "\n\nSaving...."
  end

  private

    def render_game
      @board.print_board(@wrong)
      
      print_try
      print_guesses
    end

    def print_try
      print "\n\n"
      print "    "
      @word.split('').each do |char| 
        if @try.include?(char)
          print "#{char} "
        else
          print "_ "
        end
      end
      print "\n\n"
    end

    def print_guesses
      chances = 7 - @wrong

      puts "You guessed: #{@try.join(', ')}"
      puts chances == 1 ? "Last try!" : "#{chances} chances left!"
      print "\n"
    end

    def replay_prompt
      puts "Would you like to play again?"
      input = gets.chomp

      case input
      when 'yes'
        Hangman.new
      when 'no'
        puts "Thanks for playing!"
        exit
      else
        puts 'Please enter yes or no.'
        replay_prompt
      end
    end
    
    # Arguments: file dictionary (e.g. "sample.txt")
    def sample_word file
      words = []
      File.open(file).readlines.each do |line|
        words << line
      end

      words = words.select{ |word| word.length.between?(5,12) }
      words.sample.chomp
    end

    # Returns true if single a-z character guess, unique from past guesses
    def valid_guess?(guess)
        if guess =~ /^[a-z]$/ && !@try.include?(guess)
          true
        else
          false
        end
    end

    def game_over?
      if winner? || loser?
        true
      else
        false
      end
    end

    def winner?
      if @word.split('').all? { |char| @try.include?(char) }
        true
      else
        false
      end
    end

    def loser?
      if @wrong == 7
        true
      else
        false
      end
    end
end