class Piece
  DIAGONAL = [[-1, -1], [-1, 1], [1, 1], [1, -1]]
  STRAIGHT = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  
  attr_reader :color, :pos, :board, :moved
  
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @moved = false
  end
end