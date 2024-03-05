class Person
  attr_reader :name
  attr_reader :pop
  attr_reader :pets

  def initialize(name)
    self.name = name
    self.pets = ["buddy", "larry", "hatcat"]
  end

  def pop
    p "you dead"
  end

  def random
    ::pop
  end

  private

  attr_writer :name
  attr_writer :pets
end

person1 = Person.new("fred")
# p person1.pets.pop
# p person1.pets
# person1.pop
p person1.random



=begin
29
When does accidental method overriding occur, and why? Give an example.
=end


<<~Answer
THIS IS A MESS FIGURE THIS OUT LATER =)
Answer

