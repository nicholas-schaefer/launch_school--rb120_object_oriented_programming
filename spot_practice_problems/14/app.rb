=begin
14

=end

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other_class)
    name == other_class.name
  end
end

p al = Person.new('Alexander')
p alex = Person.new('Alexander')
p al == alex # => true

<<~Answer
answer: returns false
false because `==` is comparing two separate instances of a class, instances will have different instance ids
Answer
