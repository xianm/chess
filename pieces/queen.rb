# encoding: utf-8

class Queen < SlidingPiece
  def to_s
    if @color == :white
      "♛".white
    else
      "♛".black
    end
  end
  
  def move_dirs
    DIAGONAL + STRAIGHT
  end
end
