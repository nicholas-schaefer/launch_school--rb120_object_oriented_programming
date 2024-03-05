
# p Triangle.sides
p Triangle.new.sides

=begin
19
# What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class?
Give an example.
=end

<<~Answer
attr_accessor is an access control method
it is shorthand for writing both a getter an an accessor.

WTF no! We don't usually want everything publically writable, oftentimes we don't even want everything pubically readable

to lazy, maybe later will write an example!
Answer
