class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end

end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name
p sir_gallant.speak

=begin
47
=end

<<~Answer
returned this:
"Sir Gallant"
"Gallant is speaking."

would need to do this
Answer

