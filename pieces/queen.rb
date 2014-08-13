# encoding: utf-8

class Queen < SlidingPiece
  def to_s
    @color == :white ? "♕" : "♛" 
  end
  
  def move_dirs
    DIAGONAL + STRAIGHT
  end
end