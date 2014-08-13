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

  def move(player, to_pos)
    return unless legal_move?(player, to_pos)

    @moved = true

    from_pos = @pos

    @board[to_pos] = self
    @pos = to_pos
    @board[from_pos] = nil
  end

  def legal_move?(player, to_pos)
    valid_moves = moves

    raise "Player can only move their own piece." if player.color != @color
    raise "Illegal move." unless moves.include?(to_pos)

    # todo: will move put us in check?

    true
  end

  def valid_move?(piece, to_pos)
    return false unless to_pos.all? { |i| i.between?(0,7 ) }

    target = @board[to_pos]
    target.nil? || piece.color != target.color
  end
end
