# encoding: utf-8

class Pawn < Piece
  def to_s
    @color == :white ? "♙" : "♟"
  end
  
  def moves
    moves = []
    
    move_dirs.each do |offset|
      dpos = [@pos[0] + offset[0], @pos[1] + offset[1]]
      moves << dpos if @board.legal_move?(self, dpos)
    end
    
    attack_move_dirs.each do |offset|
      dpos = [@pos[0] + offset[0], @pos[1] + offset[1]]
      
      next if @board[dpos].nil?
      
      moves << dpos if @board[dpos].color != @color
    end
    
    moves
  end
  
  def move_dirs
    moves = (@color == :white ? [[0, 1]] : [[0, -1]])
    moves << (@color == :white ? [0, 2] : [0, -2]) unless @moved
    moves
  end
  
  def attack_move_dirs
    @color == :white ? [[1, 1], [-1, 1]] : [[1, -1], [-1, -1]]
  end
end