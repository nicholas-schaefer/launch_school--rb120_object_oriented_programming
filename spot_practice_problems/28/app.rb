class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end

  # def to_s
  #   "For class:'#{self.class}'. Name is #{name}, and age is #{age}."
  # end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky

=begin
28
What is output and why? How could we output a message of our choice instead?

How is the output above different than the output of the code below, and why?
=end


<<~Answer
code is the same!!!!!!!!!
Answer

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end
