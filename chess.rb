#!/usr/bin/env ruby
require 'yaml'
require 'colorize'
require './errors'
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
    @move_history = []
  end
  
  def save_game
    begin
      print "\nSave the game (y/n)? "
      selection = STDIN.gets.chomp
      raise InvalidInputError unless selection == "y" || selection == "n"
    rescue InvalidInputError => error
      puts "#{error.message}"
    end
    
    if selection == "y"
      timestamp = Time.new.strftime("%F-%H%M%S")
      File.open("chess_#{timestamp}.cg", "w") { |file| file << self.to_yaml }
    end
  end
  
  def self.load_game(file)
    YAML.load_file(file)
  end
  
  def play
    until game_over?
      render

      begin
        @move_history << handle_move(get_move)
      rescue InvalidMoveError => error 
        puts error.message
        retry
      rescue Interrupt
        save_game
        exit
      end

      switch_turns
    end
    
    render
    puts "#{winner.name} wins."
    render_history
  end

  def game_over?
    @board.checkmate?(:white) || @board.checkmate?(:black)
  end
  
  def winner
    @board.checkmate?(:white) ? @black_player : @white_player
  end
  
  def render
    puts ""
    @board.render
    puts ""
  end
  
  def render_history
    puts ""
    puts "-- Move History"
    puts @move_history.join("\n")
    puts ""
  end
  
  def get_move
    print "#{@active_player.name} > "
    move = @active_player.get_move
  end
  
  def handle_move(move)
    @board.move(@active_player, move.from, move.to)
    move
  end

  def switch_turns
    @active_player = (@active_player == @white_player) ? @black_player : @white_player
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Chess.new
  game = Chess.load_game(ARGV[0]) unless ARGV.empty?
  game.play
end