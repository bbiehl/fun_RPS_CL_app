# filepath: ./lib/match.rb
require 'player'
require 'game'

class Match
  def initialize
    @games = []
  end
  def launch!
    human_name
    computer_name
    display_game_rules
    until @games.count(:human_wins) == 7 || @games.count(:computer_wins) == 7 || @human_move == "quit" do 
      read_score
      play_game
    end
    final_score
  end
  
  private

  def human_name
    puts "What's your name?"
    human = Player.new
    human.set_name
    puts "Hello: #{human.get_name}"
    @human_name = human.get_name
  end

  def computer_name
    puts "What is the computer's name?"
    computer = Player.new
    computer.set_name
    puts "We are #{computer.get_name}"
    @computer_name = computer.get_name
  end

  def display_game_rules
    puts "\nThe rules of the game are simple\n"
    sleep(1)
    puts "\nThe accepted moves are:"
    num = 1
    Game.valid_moves.each do |move|
      puts "#{num}) #{move}"
      num += 1
    end
    sleep(1)
    puts "-----"
    sleep(1)
    num = 1
    Game.rules.each do |k,v|
      puts "#{num}) #{k} defeats #{v}"
      num +=1
    end
    sleep(1)
    puts "\nYou may quit and forfeit the match at any time by entering 'quit'"
  end

  def read_score
    puts "Games played: #{@games.count}"
    puts "The score is #{@human_name}: #{@games.count(:human_wins)} - #{@computer_name}: #{@games.count(:computer_wins)}"
  end

  def final_score
    puts "Games played: #{@games.count}"
    puts "The final score is #{@human_name}: #{@games.count(:human_wins)} - #{@computer_name}: #{@games.count(:computer_wins)}"
  end

  def play_game
    set_human_move
    set_computer_move
    unless @human_move == "quit"
      game = Game.new(@human_move, @computer_move)
      puts "#{@computer_name} move is: #{@computer_move}"
      puts "Game result is #{game.result}"
      @games.push(game.result)
    end
  end

  def set_human_move(move=nil)
    until Game::valid_moves.include?(move) == true do 
      print "#{@human_name}, what is your move? "
      move = gets.chomp.to_s.strip.downcase.gsub(/([^\w])/, '')
      if Game::valid_moves.include?(move) == false
        puts "#{move} is not a valid move!"
        puts "Try again!"
      end
    end
    @human_move = move
  end

  def set_computer_move
    random_int = rand(3)
    case random_int
    when 0
      move = "rock" 
    when 1
      move = "paper"
    when 2
      move = "scissors" 
    end
    @computer_move = move
  end
end
