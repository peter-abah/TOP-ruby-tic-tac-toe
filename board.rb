class Board
  def initialize(board = Array.new(9))
    @board = board
  end

  def update(move, player)
    board = @board.dup
    board[move] = player
    Board.new(board)
  end

  def played?(move)
    @board[move] ? true : false
  end
end
