class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

# p Triangle.sides
p Triangle.new.sides

=begin
18
What can executing `Triangle.sides` return?
What can executing `Triangle.new.sides` return?
What does this demonstrate about class variables?
=end

<<~Answer
What can executing `Triangle.sides` return?
- nil
can't find it in the triangle class, can find it in shape, class variable there is initialized to `nil`

What can executing `Triangle.new.sides` return?
- 3
It is initialized!!!! Thus it's available in `Triangle` class

What does this demonstrate about class variables?
- They are not viewable if they are only created once initialing

Answer
