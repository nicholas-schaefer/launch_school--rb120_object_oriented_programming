=begin
What is output and why?
What does this demonstrate about instance variables that differentiates them from local variables?
=end

class Person
  attr_reader :name

  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name


<<~Answer
Output is  `nil`

The output is nothing, because line 7 creates the getter method to the instance variable @name, which is instantiated to 'nil'
On line 10, instance variable @name is reassigned to line String Value 'bob'.
However this reassignment never occurs as the `set_name` method is not called. Instance variables are not initialized /reassigned
until they are called

Answer
=begin

=end
