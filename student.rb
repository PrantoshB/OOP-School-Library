require './person'

class Student < Person
  def initialize(classroom)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom(classroom)
    @classroom = classrom
    classroom.students.push(self)
  end

  attr_accessor :classroom
end
