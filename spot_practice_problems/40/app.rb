module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
# pingu.fly
p pingu.class.ancestors

=begin
40
What is the method lookup path that Ruby will use as a result of the call to the `fly` method?
Explain how we can verify this.
=end

<<~Answer
- Penguin
- Migratory
- Aquatic
- Bird
- Animal
- Object
- Kernel
- BasicObject

call this method, array return matches above result
`p pingu.class.ancestors`

Answer

