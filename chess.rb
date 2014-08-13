require './pieces'
require './board'
require './move'

class Chess
  def initialize
    @board = Board.new
  end
  
  def play
    until game_over?
      render
      handle_move(get_move)
    end
  end
  
  def game_over?
    return false
  end
  
  def render
    puts ""
    @board.render
    puts ""
  end
  
  def get_move
    begin
      print " > "
      move = Move.parse_input(gets.chomp)
    rescue InvalidMoveError => error
      puts error.message
      retry
    end
  end
  
  def handle_move(move)
    
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Chess.new
  game.play
end