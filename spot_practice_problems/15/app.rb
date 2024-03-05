class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name

=begin
15
# What is output on `lines 14, 15, and 16` and why?
=end

<<~Answer
# Bob
# My name is BOB.
# BOB

reasoning, `upcase` is a destructive method.
This means it mutates the instance variable
Answer
