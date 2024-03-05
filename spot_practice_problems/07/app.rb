=begin
question 7.
What does the code above output, and why? What does this demonstrate about class variables,
and why we should avoid using class variables when working with inheritance?
=end

class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

# p Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels
p Vehicle.wheels

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels

<<~Answer
p Vehicle.wheels## 4

Apparently if a class variable is reassigned in a subclass, it reassigns it in all super classes and subclasees as well!
Answer
