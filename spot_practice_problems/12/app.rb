=begin
12
We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?
=end
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

# bob.pets.jump

bob.pets.each(&:jump)


<<~Answer
represent different classes?
Answer
