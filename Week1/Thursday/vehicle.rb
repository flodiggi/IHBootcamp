class Vehicle
  attr_reader :noise, :wheels
  def initialize(wheels, noise)
    @wheels = wheels
    @noise = noise
  end

  def make_noise
    puts @noise
  end
end

class VehicleHandler
  def initialize(array)
    @array = array
  end

  def count_wheels
    totalwheels = @array.reduce(0) do |sum, vehicle|
      sum += vehicle.wheels
    end
  end

  def make_noises
    @array.each do |vehicle|
      vehicle.make_noise
    end
  end
end

car = Vehicle.new(4,"Bruuuuuuuuum")
motorbike = Vehicle.new(2,"Vuuum Vuuum")
bicycle = Vehicle.new(2, "Ring Ring")

vehicles_array = [car, motorbike, bicycle]


handler = VehicleHandler.new(vehicles_array)
puts handler.count_wheels
handler.make_noises
