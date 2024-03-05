class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new



=begin
38
If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`?
Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?
=end

<<~Answer
No, they are different instances.
not comparing class, comparing class instances
Answer

