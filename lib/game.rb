require './lib/player'

class Game
  WIN_POSITIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :current_player

  def initialize(player1, player2)
    @board = Array.new(9)
    @current_player = 0
    @players = [Player.new(player1, 'X'), Player.new(player2, 'O')]
    puts "#{@players[current_player].name} goes first."
  end

  def switchPlayer
    @current_player = 1 - @current_player
  end

  def has_won?(player)
      WIN_POSITIONS.any? do |candidate|
      candidate.all? {|position| @board[position] ==  player.mark}
      end
  end

  def board_full?
    @board.any?.nil?
  end

  def print_board
    
  end

end
