=begin
Question:
  What is output and why?
  What does this demonstrate about instance variables?
=end

module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim

<<~Answer
  output is `nil`
  because instance variable @can_swim is not found.
  In ruby, when instance variables are not found, they return nil
  (this differs from local variables, which instead throw a method/variable not found error)
Answer

