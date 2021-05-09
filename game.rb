class Game
  def initialize
    @players = %w(X 0)
    @board = Board.new
  end

  def start
    turn = 0
    game_end = false
    puts @board
    until game_end
      current_player = @players[turn]
      move = get_move
      @board = @board.update(move, current_player)
      puts @board
      game_end = game_end?
    end
  end

  private

  def get_move
    puts 'Enter a valid move'
    loop do
      move = gets.split(',').map(&:to_i)
      break if valid_move?(move)
    end
    move
  end

  def valid_move?(move)
    move.all { |e| e.between(0, 2) } ? @board.played?(move) : false
  end

  def game_end?
    if @board.win?
      puts "#{current_player} won"
      true
    elsif @board.draw?
      puts 'DRAW!'
      true
    end
    false
  end
end