# encoding: utf-8

class Knight < SteppingPiece
  def to_s
    @color == :white ? "♘" : "♞"
  end
  
  def move_dirs
    [2, -2].product([1, -1]) + [1, -1].product([2, -2])
  end
end