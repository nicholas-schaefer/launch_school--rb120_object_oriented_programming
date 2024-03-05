=begin
What is output and why?
13

=end

class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name)
    super(name)
  end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name


<<~Answer
answer is this: bark! bark!  bark! bark!
reason is @name is never initialized in class Dog.
it is initialized in the superclass Animal.
(reason it is not available, is because we are overwriting initialize method in sub class, and never assigning method paramter to the @name instance variable.)
Answer
