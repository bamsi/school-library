require_relative 'person'
attr_accessor :classroom

class Student < Person
  def initialize(age, name = 'unkonwn', parent_permission: true)
    super(name, age, parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
