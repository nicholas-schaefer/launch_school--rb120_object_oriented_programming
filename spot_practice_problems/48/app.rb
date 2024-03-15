class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)
=begin
48
What are the collaborator objects in the above code snippet, and what makes them collaborator objects?
=end

<<~Answer
The has -a relationship is between the @owner instance variable and and the Class instances objects
(a cat has an owner)

Answer

