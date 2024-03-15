class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end

=begin
50
What are the scopes of each of the different variables in the above code?
=end

<<~Answer
Line 2 (TITLES)           => Constant variable Available to entire `Person` class
Line 4 @@total_people     => Class variable Available to entire `Person` class
Line 7 @name              => Instance variable Available to entire `Person` instances
Line 11 @age              => Instance variable Available within lexical scope of `age` method, at least until called, then entire `Person` instance


Answer

