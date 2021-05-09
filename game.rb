class Game
  def initialize
    @players = %w(X 0)
    @board = Board.new
  end

  def start
    turn = 0
    game_end = false
    display_board
    until game_end
      current_player = @players[turn]
      move = get_move
      @board = @board.update(move, current_player)
      if @board.win?
        puts "${current_player} won"
        game_end = true
      elsif @board.draw?
        puts 'DRAW!'
        game_end = true
      end
    end
  end
end