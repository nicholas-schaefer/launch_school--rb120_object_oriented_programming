module Drivable
  def self.drive
  end

  # def drive
  # end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

=begin
53
What is output and why?
What does this demonstrate about how methods need to be defined in modules, and why?
=end

<<~Answer
won't be found because that's a class method
need to define methods within module's as instance methods (i.e. without `self` keyword)

Answer
