class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def update(move, player)
    board = @board.map(&:dup)
    board[move[0]][move[1]] = player
    new_board(board)
  end
end
