class Person
  attr_reader :name
  attr_accessor :age

  def initialize (name, age)
  @name = name
  @age = age
  end
end

a_person = Person.new("Bob", 29)
puts a_person.name
puts a_person.age

a_person.age = 55
puts a_person.age
