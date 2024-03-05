=begin
8
What is output and why? What does this demonstrate about `super`?
=end
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(name, color)
    super(name)
    @color = color
  end
end

bruno = GoodDog.new("bruno", "brown")
p bruno

<<~Answer
assigns argument to both local parameter @color and @name
with `super` and no `()` means it expects same number of arguments as above
Answer

