class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
    @grade = grade
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

=begin
45
Running the following code will not produce the output shown on the last line. Why not?
What would we need to change, and what does this demonstrate about instance variables?

=end

<<~Answer
add line 6
instance variables don't magically exist by existence of naming an initialize parameter with a default value

Answer

