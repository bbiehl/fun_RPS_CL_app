# filepath: ./lib/game.rb

class Game
  attr_accessor :human_move, :computer_move, :result
  @@valid_moves = ["rock", "paper", "scissors", "quit"]
  @@rules = {"rock" => "scissors", "paper" => "rock", "scissors" => "paper"}

  def self.valid_moves
    @@valid_moves
  end

  def self.rules
    @@rules
  end

  def initialize(human_move, computer_move)
    @human_move = human_move
    @computer_move = computer_move
    @result = result
  end

  def result
    if @@rules[@human_move] == @computer_move
      return :human_wins
    elsif @@rules[@computer_move] == @human_move
      return :computer_wins
    else
      return :draw
    end
  end
end