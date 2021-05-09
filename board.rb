class Board
  def initialize(board = Array.new(3) { Array.new(3) })
    @board = board
  end

  def update(move, player)
    board = @board.map(&:dup)
    board[move[0]][move[1]] = player
    Board.new(board)
  end
end
