class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

cat1 = Cat.new("cougar")
p cat1
cat1.make_one_year_older
p cat1
=begin
52
In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix?
Which use case would be preferred according to best practices in Ruby, and why?
=end

<<~Answer
could have alternatively done it like this =>     @age += 1
self.age is best practice
reasoning
- misspelling will provide useful error messages.
- custom setter methods can provide user validation

Answer
