class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

homes.each do |hm|
  puts "#{hm.name} in #{hm.city} \n Price: #{hm.price} a night"
end

cities = homes.map do |hm|
  hm.city
end

prices = homes.map do |hm|
  hm.price
end

total_prices = prices.reduce {|sum,x| sum + x}
puts (total_prices.to_f / prices.length)

total_capacities = homes.reduce(0.0) do |sum, hm|
  sum + hm.capacity
end

puts "The average capacity is:"
puts total_capacities / homes.length


rng = 1..42

rng.each do |number|
  puts "The next number in the range is: #{number}"
end

double = rng.map do |number|
  number * 2
end

puts double
