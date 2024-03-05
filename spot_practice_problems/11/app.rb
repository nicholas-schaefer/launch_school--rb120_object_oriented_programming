=begin
11
What is output and why? How does this code demonstrate polymorphism?
=end
class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
# pp array_of_animals
array_of_animals.each do |animal|
  feed_animal(animal)
end
<<~Answer
duck typing
Answer
