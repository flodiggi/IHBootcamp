require 'pry'
require 'colorize'
class ShoppingCart
  def initialize(items)
		@totalprice = 0
		@items = items
    @freebanana = 0
	end

  def counter
    counts = Hash.new(0)
    @items.each do |item|
      counts[item.name]+=1
    end
    puts "You have the following item count:"
    counts.each do |item,quantity|
    puts "#{item}     #{quantity}"
      end
  end


  def add_item(item)
  @items[item][:quantity] += 1
  end

  def addbanana
    @items[:banana][:quantity] += 1
  end


  def show
    # binding.pry
    puts "Here is your item list:"
    @items.each do |key, i|
      puts "#{@items[key][:quantity]} #{key} each $#{@items[key][:price]}"
      if @items[key][:discount] == "freebanana" && @items[key][:quantity] >= 4
        puts "Do you want a free banana?".colorize(:green)
        useranswer = gets.chomp
        if useranswer.upcase == "YES"
        @freebanana =+ 1
        puts "#{@freebanana} banana is added to your cart".colorize(:blue)
        addbanana
        end
      end
    end
  end

  def totalprice
    puts "Applying discounts......".colorize(:green)
    total_price_twoforone = nil
    total_price_threefortwo = nil
    @items.each do |key,i|
      if @items[key][:discount] == "241"
        if @items[key][:quantity]%2 == 0
            total_price_twoforone = ((@items[key][:price])/2)* (@items[key][:quantity])
          else
            total_price_twoforone = ((@items[key][:price])/2)* (@items[key][:quantity]) +  (@items[key][:price])/2
        end

      elsif @items[key][:discount] == "342"
        total_price_threefortwo = (@items[key][:price])* (@items[key][:quantity]) - (@items[key][:price])*((@items[key][:quantity])/3)
      else
        @totalprice += (@items[key][:price])* (@items[key][:quantity])
      end
    end
         @totalprice += total_price_twoforone
         @totalprice += total_price_threefortwo
         puts "Your total price is $#{@totalprice}".colorize(:blue)
  end
end



#season prices
apple_price = [10,10,15,12]
orange_price = [5,2,5,5]
grapes_price = [15,15,15,15]
banana_price = [20,20,20,21]
#regular & sunday:
watermelon_price = [50,100]

puts "Please state your current day: (Monday - Sunday)"
userday = gets.chomp
puts "Please state your season: ('Spring, Summer, Autumn, Winter')"
if userday.upcase == "SUNDAY"
  day = 1
else day = 0
end
userseason = gets.chomp
if userseason.upcase == "SPRING"
season = 0
elsif userseason.upcase == "SUMMER"
season = 1
elsif userseason.upcase == "AUTUMN"
season = 2
elsif userseason.upcase == "WINTER"
season = 3
end







items = {
  :apples  =>    {:price => apple_price[season], :quantity => 0, :discount => "241"},
  :oranges   =>  {:price => orange_price[season], :quantity => 0, :discount => "342"},
  :grapes   =>   {:price => grapes_price[season], :quantity => 0, :discount => "freebanana"},
  :banana    =>  {:price => banana_price[season], :quantity => 0, :discount => "normal"},
  :watermelon => {:price => watermelon_price[day], :quantity => 0,:discount => "normal"}
}


cart = ShoppingCart.new(items)
cart.add_item :apples
cart.add_item :apples
cart.add_item :apples
cart.add_item :grapes
cart.add_item :grapes
cart.add_item :grapes
cart.add_item :grapes
cart.add_item :grapes
cart.add_item :oranges
cart.add_item :oranges
cart.add_item :oranges
cart.add_item :oranges
cart.add_item :oranges
cart.add_item :oranges
cart.add_item :banana
cart.add_item :banana
cart.add_item :watermelon
cart.show
cart.totalprice
