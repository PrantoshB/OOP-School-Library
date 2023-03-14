class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classrom = self
  end

  attr_accessor :label, :students
end
