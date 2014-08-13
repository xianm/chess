class Piece
  DIAGONAL = [[-1, -1], [-1, 1], [1, 1], [1, -1]]
  STRAIGHT = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  
  attr_accessor :pos, :moved
  attr_reader :color, :board
  
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @moved = false
  end
  
  def moves
    raise NotImplementedError
  end
  
  def valid_moves
    moves.reject { |move| move_into_check?(move) }
  end
  
  def move_into_check?(to_pos)
    dup_board = @board.dup
    dup_board.move!(@pos, to_pos)
    dup_board.in_check?(@color)
  end

  def valid_move?(to_pos)
    return false unless to_pos.all? { |i| i.between?(0,7 ) }
    to = @board[to_pos]
    to.nil? || @color != to.color
  end
end
