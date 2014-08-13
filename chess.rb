require './player'
require './pieces'
require './board'
require './move'

class Chess
  def initialize()
    @board = Board.new
    @white_player = Player.new("White", :white, @board)
    @black_player = Player.new("Black", :black, @board)
    @active_player = @white_player
  end
  
  def play
    until game_over?
      render
      begin
        handle_move(get_move)
      rescue StandardError => error
        puts error.message
        retry
      end
      switch_turns
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
      print "#{@active_player.name} > "
      move = @white_player.get_move
    rescue InvalidMoveError => error
      puts error.message
      retry
    end
  end
  
  def handle_move(move)
    @board.do_move(@active_player, move)
  end

  def switch_turns
    @active_player = (@active_player == @white_player) ? @black_player : @white_player
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Chess.new
  game.play
end
