class InvalidMoveError < StandardError
  def message
    "Please enter a valid move (ex: b1 b2)!"
  end
end

class EmptyMoveError < InvalidMoveError
  def message
    "You cannot move an empty piece."
  end
end

class PermissionError < InvalidMoveError
  def message
    "You do not have permission to move that piece."
  end
end

class MoveIntoCheckError < InvalidMoveError
  def message
    "You cannot move yourself into check."
  end
end

class InvalidInputError < StandardError
  def message
    "Please make a valid selection"
  end
end