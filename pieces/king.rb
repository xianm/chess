# encoding: utf-8

class King < SteppingPiece
  def to_s
    @color == :white ? "♔" : "♚"
  end
  
  def move_dirs
    DIAGONAL + STRAIGHT
  end
end