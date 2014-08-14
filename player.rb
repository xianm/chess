class Player
  attr_reader :name, :color

  def initialize(name, color, board)
    @name = name
    @color = color
    @board = board
  end

  def get_move
    Move.parse_input(self, STDIN.gets.chomp)
  end
  
  def get_promotion
    pieces = [Queen, Bishop, Rook, Knight]
    pieces.each_with_index { |piece, i| puts "#{i + 1}: #{piece}" }
    begin
      print "#{@name} Promotion > "
      pieces[Integer(STDIN.gets.chomp) - 1]
    rescue ArgumentError
      puts "Invalid selection, try again."
      retry
    end
  end
end