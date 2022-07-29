require_relative 'person'

class Student < Person
  def initialize(classroom, age, name = 'unkonwn', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
