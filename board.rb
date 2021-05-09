class Board
  BOARD_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

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

  def win?(player)
    BOARD_COMBINATIONS.some do |c|
      c.all { |i| @board[i] == player }
    end
  end

  def draw?
    BOARD_COMBINATIONS.all do |c|
      c.all { |i| @board[i].nil? }
    end
  end

  def to_s
    result = [' _ _ _ ']
    0.upto 2 do |y|
      row = ['|']
      0.upto 2 do |x|
        row.push(board[y * 3 + x])
      end
      row.push('|')
      result.push(row.join(" "))
    end
    result.push(' _ _ _ ')
    result.join('\n')
  end
end
