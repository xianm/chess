class SlidingPiece < Piece
  def moves
    moves = []
    
    move_dirs.each do |offset|
      dpos = [@pos[0] + offset[0], @pos[1] + offset[1]]
      moves |= moves_in_dir(dpos, offset)
    end
    
    moves
  end
  
  def moves_in_dir(pos, dir)
    dpos = [pos[0] + dir[0], pos[1] + dir[1]]

    return [] unless valid_move?(self, pos)
    return [pos] unless @board[pos].nil?
  
    [pos] + moves_in_dir(dpos, dir)
  end
end
