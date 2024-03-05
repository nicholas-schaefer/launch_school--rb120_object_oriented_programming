=begin
Question:
What is output and why?
What does this demonstrate about constant scope?
What does `self` refer to in each of the 3 methods above?

=end

module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape

<<~Answer
p Square.sides => 4
works, see reasoning below



p Square.new.sides => 4
Reasoning.
Square instance searches up the lookup chain, finding `sides` method within the class `Shape`.
`self` within the `sides` method refers to the class the instance that is calling the method...
...chaining `self` to the `#class` method returns the class name `Square`.
Therefor `self.class::SIDES` is really equivalent in this instance to `Square::SIDES`
in the above call, `::` refers to the constant resolution operator.
Since there is no Constant named `SIDES` in the `Square Class`, the program searches for it up the lookup chain.
Next lookup chai nstop is the `Quadrilateral` class
There the constant `SIDES` is found and its integer value of 4 is returned!

p Square.new.describe_shape =? uninitialiazed constant.
You need to do this!!!!!
  "I am a \#{self.class} and have \#{self.class::SIDES} sides."

Answer

