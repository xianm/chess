# encoding: utf-8

class Bishop < SlidingPiece
  def to_s
    if @color == :white
      "♝".white
    else
      "♝".black
    end
  end
  
  def move_dirs
    DIAGONAL
  end
end
