# encoding: utf-8

class Rook < SlidingPiece
  def to_s
    if @color == :white
      "♜".white
    else
      "♜".black
    end
  end
  
  def move_dirs
    STRAIGHT
  end
end
