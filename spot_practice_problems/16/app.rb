class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    return false if ...
  end

  def change_name
    @name = "Fred".downcase!
  end

end

bob = Person.new('Bob')
puts bob.name
bob.change_name
puts bob.name


=begin
16
Why is it generally safer to invoke a setter method (if available)
vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.
=end

<<~Answer
custom setters can have validation
SPELLING MISTAKES!!!!!!! method will tell you where the error is. Instance variable will be created with nil. Private setters FTW
(they can also change values, however this is not generally advisable)
Answer
