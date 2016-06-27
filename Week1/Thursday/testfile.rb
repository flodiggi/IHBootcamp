# def callfunction(function)
#   function
# end
#
# def one
#   puts "yeaaa"
# end
#
# def two
#   puts "2"
# end
#
# def three
#   puts "3"
# end
#
#
# puts "type"
# userinput = gets.chomp
# #user types 'test'
# callfunction(userinput)
#

class Music
  def start
    p "Music"
  end
end

class Movie
  def start
    p "Movies"
  end
end

class Picture
  def start
    p "Pictures"
  end
end


class Selector
  def initialize
    @options = [Music.new, Movie.new, Picture.new]
    @option = nil

  end

  def choose
    p "Choose 1 for Music, 2 for Movie and 3 for Pics"
    @option = (gets.chomp.to_i) - 1
    @options[@option].start
  end
end

Selector.new.choose
