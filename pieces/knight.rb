# encoding: utf-8

class Knight < SteppingPiece
  def to_s
    if @color == :white
      "♞".white
    else
      "♞".black
    end
  end
  
  def move_dirs
    [2, -2].product([1, -1]) + [1, -1].product([2, -2])
  end
end
