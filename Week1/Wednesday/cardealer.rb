class CarDealer
  def initialize(inventory)
    @inventory = inventory
  end

def cars(brand)
    @inventory[brand.to_sym].each do |model|
    puts model
    end
end


end

inventory = {
  :Audi => ["A1", "A3", "A6"],
  :VW   => ["Golf", "Polo"]
}

inventory[:Audi].push("A8")


car_dealer = CarDealer.new(inventory)

car_dealer.cars("Audi")
