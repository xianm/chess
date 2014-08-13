require './move'

class Player
  attr_reader :name

  def initialize(name, board)
    @name = name
    @board = board
  end

  def get_move
    Move.parse_input(gets.chomp)
  end
end
