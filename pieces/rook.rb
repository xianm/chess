# encoding: utf-8

class Rook < SlidingPiece
  def to_s
    @color == :white ? "♖" : "♜" 
  end
  
  def move_dirs
    STRAIGHT
  end
end