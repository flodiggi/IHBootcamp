require 'pry'


class Piece
  def initialize (start, dest, color)
    @start = start
    @end = dest
    @color = color
  end

class Pawn < piece
end

class Rook < piece
end

class Bishop < piece
end

class Knight < piece
end

class Queen < piece
end

class King < piece
end
