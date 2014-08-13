class Move
  REGEXP = /[a-hA-H]{1}[1-8]{1}/
  
  attr_reader :from, :to
  
  def initialize(player, from, to, from_str, to_str)
    @player = player
    @from = from
    @to = to
    @from_str = from_str
    @to_str = to_str
  end
  
  def to_s
    "#{@player.name}: #{@from_str}, #{@to_str}"
  end
  
  def self.parse_input(player, input)
    from_str, to_str = input.split
    
    #todo: throw invalid input error?
    raise InvalidMoveError unless from_str =~ REGEXP && to_str =~ REGEXP
    
    from = Move.parse_coords(from_str)
    to = Move.parse_coords(to_str)
    
    Move.new(player, from, to, from_str, to_str)
  end
  
  def self.parse_coords(raw_input)
    split = raw_input.split("")
    [split[0].ord - "a".ord, split[1].to_i - 1]
  end
end