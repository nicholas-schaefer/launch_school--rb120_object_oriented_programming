class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    self.grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade




=begin
43
In the above code snippet, we want to return `”A”`.
What is actually returned and why? How could we adjust the code to produce the desired result?
=end

<<~Answer
actually returns `nil`
just need to add `self` to line 10
Answer

