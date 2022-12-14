require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name, parent_permission)
    @id = rand(100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  private

  def of_age?
    (@age >= 18)
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
