=begin
10
What is the method lookup path used when invoking `#walk` on `good_dog`?
=end
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  PI = 3.14
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk
p GoodAnimals::PI


<<~Answer
Interpreter looks within GoodDog class, finds nothing.
Looks in included modules, starting with the one on lowest line
  finds nothing in Danceable
  finds nothing in Swimmable
Looks in super class Animal
  finds nothing in main Animal Class
Looks in included module Walkable
  finds methods #walk
  returns method return value "I'm walking."
Answer

