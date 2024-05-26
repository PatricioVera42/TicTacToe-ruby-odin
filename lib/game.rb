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

  def switch_player
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

  def place_player_marker(player)
    position = select_position(player)
    puts "#{player} selects #{player.mark} position #{position}"
    @board[position] = player.mark
  end

  def select_position(player)
    print_board
    loop do
      print "Select your #{player.mark} position: "
      position = gets.to_i
      return position if @board[position].nil?
      puts "Position #{position} is not available. Try again."
    end  
  end

  def print_board
    printed_board = [[board[0],board[1],board[2]], [board[3],board[4],board[5]], [board[6],board[7],board[8]]]
    for i in 0...printed_board.length
      puts printed_board[i].join(" | ") + "\n"
      print  "\n"
    end
  end

  def play
    loop do
      place_player_marker(@players[current_player])
      
      if has_won?(@players[current_player])
        puts "#{@players[current_player]} wins!"
        print_board
        return
      elsif board_full?
        puts "It's a draw."
        print_board
        return
      end
      
      switch_player
    end
  end
    
end
