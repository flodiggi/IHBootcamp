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
  Home.new("Nizar's place", "Barcelona", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "Barcelona", 4, 49),
  Home.new("Nikel's place", "Bielefeld", 5, 10),
  Home.new("Flo's place", "Munich", 1, 100),
  Home.new("Heinz-Baltharsar's place", "St.Tropez", 3, 45),
  Home.new("Felix's place", "Passau", 2, 45),
  Home.new("Tom's place", "Madrid", 4, 41)
]

puts "The following houses are available:"

homes.each do |hm|
  puts "#{hm.name} in #{hm.city} \n Price: $#{hm.price} a night"
end

correctsortingmethod = false
while correctsortingmethod == false
  puts "How do you want to sort by ('pricehigh' , 'pricelow' or 'capacity') ? "

  sortingmethod = gets.chomp


    if sortingmethod == "pricehigh"
        homessorted = homes.sort{|a, b| b.price <=> a.price}
        correctsortingmethod = true
    elsif sortingmethod == "pricelow"
        homessorted = homes.sort_by{|home| home.price}
        correctsortingmethod = true
    elsif sortingmethod == "capacity"
      homessorted = homes.sort_by{|home| home.capacity}
        correctsortingmethod = true
    else
      puts "You didnt choose a correct method, please choose one of the 3 options"
        correctsortingmethod = false
    end
end

homessorted.each do |hm|
  puts "#{hm.name} in #{hm.city} \n Price: $#{hm.price} a night"
end

puts "Do you want to filter by city? ('yes' 'no')"
filteranswer = gets.chomp

if filteranswer == "yes"
    puts "By which city do you want to filter?"
    cityfilter = gets.chomp
    filteredcities = homessorted.select do |hm|
    hm.city == cityfilter.capitalize
    end
    filteredcities.each do |hm|
      puts "#{hm.name} in #{hm.city} \n Price: $#{hm.price} a night"
    end

    pricesfiltered = filteredcities.map do |hm|
      hm.price
    end

    total_prices_filtered = pricesfiltered.reduce(0.0) {|sum,x| sum + x}
    puts "The average price for your selected city is $#{(total_prices_filtered / pricesfiltered.length)}"
else
    pricesnotfiltered = homessorted.map do |hm|
    hm.price
    end

    total_prices_notfiltered = pricesnotfiltered.reduce(0.0) {|sum,x| sum + x}
    puts "The average price of available houses is $#{(total_prices_notfiltered / pricesnotfiltered.length)}"
end

puts "Which price do you want to pay?"

userprice = gets.chomp

targetprice = homes.find do |hm|
  hm.price == userprice.to_i
end

if
  targetprice == nil
  puts "Unfortunately there are no houses offering your target price, here are all avilable cheaper options though:"
  cheaphomes = homessorted.delete_if {|home| home.price >= userprice.to_i }

    cheaphomes.each do |hm|
      puts "#{hm.name} in #{hm.city} \n Price: $#{hm.price} a night"
    end
else
  puts "The first home that costs $#{userprice} is:"
  puts "#{targetprice.name} in #{targetprice.city}"

end
