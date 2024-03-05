=begin
In the code above, we hope to output `'BOB'` on `line 16`.
Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?

=end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name


<<~Answer
needed to add self!!!

Answer

