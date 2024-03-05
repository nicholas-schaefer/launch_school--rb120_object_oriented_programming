class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak

=begin
41
What does this code output and why?
=end

<<~Answer
Daisy says moooooooooooo!
Cow overrides superclass's `sound` method
However, it utilizes the first bit and adds to it!
Answer

