class Car
  # attr_reader(:name, :sound)

  def initialize(sound = "PPPPPP")
    @sound = sound #@irgendwas kann von allen methods gelesen werden
    @cities = []
  end
  def make_sound
    puts @sound
  end
  def add_city(city)
    @cities.push(city)
  end
  def cities_visited(save = false)

    if save
    IO.write("#{self.object_id}.txt", @cities)
    else
    puts "Cities I visited:"
    @cities.each do |current_city|
      puts "--> #{current_city}"
      end
    end
  end

  # def self.speed_control
  #   puts "What is your current speed"
  #   user_speed = gets.chomp
  # if user_speed.to_i >= 100
  #   puts " you are too fast"
  # end
  # end
end

class RacingCar < Car

end


my_car = Car.new("BROOOOMMMM")
another_car = Car.new("broom")

my_car.add_city("Munich")
my_car.add_city("Barcelona")
my_car.make_sound

another_car.add_city("London")
another_car.make_sound

my_car.cities_visited
another_car.cities_visited

# IO.write("citynames.txt",my_car.cities)


racingCar = RacingCar.new
racingCar.make_sound
racingCar.add_city("Madrid")
racingCar.cities_visited
