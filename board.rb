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
    BOARD_COMBINATIONS.any? do |c|
      c.all? { |i| @board[i] == player }
    end
  end

  def draw?
    BOARD_COMBINATIONS.all? do |c|
      c.all? { |i| @board[i].nil? }
    end
  end

  def to_s
    result = ['-' * 9]
    0.upto 2 do |y|
      result.push(create_row(y))
    end
    result.push('-' * 9)
    result.join("\n")
  end

  def create_row(y)
    row = ['|']
    0.upto 2 do |x|
      s = @board[y * 3 + x] || ' '
      row.push(s)
    end
    row.push('|')
    row.join(' ')
  end
end
