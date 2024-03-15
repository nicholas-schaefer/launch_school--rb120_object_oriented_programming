class FarmAnimal
  def speak
    "#{self} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak
p Lamb.new.speak
p Cow.new.speak

=begin
47
What is output and why?
=end

<<~Answer
"#<Sheep:0x00007f53e4d61a48> says baa!"
"#<Lamb:0x00007f53e4d613b8> says baa!baaaaaaa!"
"#<Cow:0x00007f53e4d610e8> says mooooooo!"

To fix this, change it to `self.class`
Answer

