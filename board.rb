class Board
  def initialize(reset = true)
    @grid = Array.new(8) { Array.new(8) } 
    reset_pieces if reset
  end
  
  def [](pos)
    x, y = pos
    @grid[y][x]
  end
  
  def []=(pos, value)
    x, y = pos
    @grid[y][x] = value
  end
  
  def dup
    dup_board = Board.new(false)
    
    pieces.each do |piece|
      dup_board[piece.pos] = piece.class.new(dup_board, piece.pos, piece.color)
    end
    
    dup_board
  end

  def pieces
    @grid.flatten.compact
  end
  
  def pieces_by_color(color)
    pieces.select { |piece| piece.color == color }
  end

  def enemy_pieces(our_color)
    pieces.select { |piece| piece.color != our_color }
  end
  
  def players_king(color)
    pieces_by_color(color).find { |piece| piece.is_a?(King) }
  end
  
  def in_check?(color)
    king = players_king(color)
    enemy_pieces(color).any? { |piece| piece.moves.include?(king.pos) }
  end
  
  def checkmate?(color)
    in_check?(color) && pieces_by_color(color).all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def move(player, from_pos, to_pos)
    from = self[from_pos]
    
    raise EmptyMoveError if from.nil?
    raise PermissionError if player.color != from.color
    raise MoveIntoCheckError if from.moves_into_check.include?(to_pos)
    raise InvalidMoveError unless from.valid_moves.include?(to_pos)
    
    move!(from_pos, to_pos)
  end
  
  def move!(from_pos, to_pos)
    from = self[from_pos]
    from.pos = to_pos
    from.moved = true

    self[to_pos] = from
    self[from_pos] = nil
  end
  
  def reset_pieces
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    
    [[0, :white], [7, :black]].each do |(y, color)|
      pieces.each_with_index do |piece, x|
        self[[x, y]] = piece.new(self, [x, y], color)
      end
    end

    8.times do |i|
     self[[i, 1]] = Pawn.new(self, [i, 1], :white)
     self[[i, 6]] = Pawn.new(self, [i, 6], :black)
    end
  end
  
  def render
    puts "  #{('a'..'h').to_a.join(" ")}"
      
    @grid.each_with_index do |row, y|
      print "#{y + 1} "
      row.each_with_index do |piece, x|
        if (x % 2 == 0 && y % 2 == 0) || (x % 2 != 0 && y % 2 != 0)
          print "#{piece.nil? ? " " : piece } ".on_light_white
        else
          print "#{piece.nil? ? " " : piece } ".on_white
        end
      end
      print "\n"
    end
  end
end