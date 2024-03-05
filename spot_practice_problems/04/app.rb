=begin
Question:
What is output? Is this what we would expect when using `AnimalClass#+`?

If not, how could we adjust the implementation of `AnimalClass#+`
to be more in line with what we'd expect the method to return?


=end
class AnimalSpecies
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  def +(other_class)
    [name] << other_class.name
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mammals = AnimalSpecies.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalSpecies.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

pp mammals
p "---"
pp birds

some_animal_classes = mammals + birds

pp some_animal_classes

<<~Answer


Answer

