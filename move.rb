class Move
  REGEXP = /[a-hA-H]{1}[1-8]{1}/
  
  attr_reader :from, :to
  
  def initialize(from, to)
    @from = from
    @to = to
  end
  
  def self.parse_input(user_input)
    raw_from, raw_to = user_input.split
    
    raise InvalidMoveError unless raw_from =~ REGEXP && raw_to =~ REGEXP
    
    from = Move.parse_coords(raw_from)
    to = Move.parse_coords(raw_to)
    
    Move.new(from, to)
  end
  
  def self.parse_coords(raw_input)
    split = raw_input.split("")
    [split[0].ord - "a".ord, Integer(split[1]) - 1]
  end
end