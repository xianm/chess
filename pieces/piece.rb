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

  def move(to_pos)
    @moved = true

    from_pos = @pos

    @board[to_pos] = self
    @pos = to_pos

    unless @board[from_pos].nil?
      @board[from_pos] = nil
    end
  end
end
