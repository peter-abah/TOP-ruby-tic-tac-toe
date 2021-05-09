require './board'

class Game
  def initialize
    @players = %w[X 0]
    @board = Board.new
  end

  def start
    turn = 0
    game_end = false
    until game_end
      puts @board
      current_player = @players[turn]
      @board = @board.update(get_move, current_player)
      game_end = game_end?(current_player)
      turn = (turn + 1) % 2
    end
  end

  private

  def get_move
    move = 0
    loop do
      print "\nEnter a valid move  (1 - 9):"
      move = gets.to_i - 1
      break if valid_move?(move)
    end
    move
  end

  def valid_move?(move)
    move.between?(0, 8) ? !@board.played?(move) : false
  end

  def game_end?(player)
    if @board.win?(player)
      puts "#{@board}\n#{player} won"
      true
    elsif @board.draw?
      puts "#{@board}\nDRAW!"
      true
    else
      false
    end
  end
end
