require 'board'

class Game
  def initialize
    @players = %w(X 0)
    @board = Board.new
  end

  def start
    turn = 0
    game_end = false
    until game_end
      puts @board
      current_player = @players[turn]
      move = get_move
      @board = @board.update(move, current_player)
      game_end = game_end?
      turn = (turn + 1) % 2
    end
  end

  private

  def get_move
    puts 'Enter a valid move'
    loop do
      move = gets.to_i - 1
      break if valid_move?(move)
    end
    move
  end

  def valid_move?(move)
    move.between(0, 8) ? @board.played?(move) : false
  end

  def game_end?
    if @board.win?
      puts "#{@board}\n#{current_player} won"
      true
    elsif @board.draw?
      puts "#{@board}\nDRAW!"
      true
    end
    false
  end
end