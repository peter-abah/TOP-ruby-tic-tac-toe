class Board
  def initialize(board = Array.new(9))
    @board = board
  end

  def update(move, player)
    board = @board.dup
    board[move] = player
    Board.new(board)
  end
end
