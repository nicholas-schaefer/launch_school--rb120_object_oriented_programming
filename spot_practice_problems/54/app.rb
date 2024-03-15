class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    self.price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)

puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive

=begin
54
What module/method could we add to the above code snippet to output the desired output on the last 2 lines, and why?
=end

<<~Answer
see above
- include Comparable module
- define spaceship operator method

Answer
