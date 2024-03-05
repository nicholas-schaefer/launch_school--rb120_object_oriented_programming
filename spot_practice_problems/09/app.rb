=begin
9
What is output and why? What does this demonstrate about `super`?

=end
class Animal
  def initialize()
    @name = "fred"
  end
end

class Bear < Animal
  def initialize(color)
    super()
    @color = color
  end
end

bear = Bear.new("black")
p bear

<<~Answer
super on its own means it expects number of arguments in super class
  super class has 0 arguments
  therefore, subclass Bear initialize method expects 0 arguments
  therefore, wrong number of arguments error thrown

solution; change `super` to `super()`.
This means subclass will not worry about how many arguments are passed
Answer

