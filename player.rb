class Player
  attr_reader :name, :color

  def initialize(name, color, board)
    @name = name
    @color = color
    @board = board
  end

  def get_move
    Move.parse_input(self, gets.chomp)
  end
end