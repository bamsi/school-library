require 'pry'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'person'
require_relative 'rental'
class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'list'
  end

  def list_persons
    ObjectSpace.each_object(Person) { |x| puts "[#{x.class}] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}" }
  end

  def create_person(type:, age:, name:, specialization: 'unkonwn', parent_permission: true)
    if type == 1
      # create a student
      @persons.push(Student.new(age: age, name: name, parent_permission: parent_permission))
    else
      @persons.push(Teacher.new(specialization: specialization, age: age, name: name))
    end
    puts 'Person Created Successfully!', "\n"
  end

  def create_book(title:, author:)
    @books.push(Book.new(title, author))
    puts 'Book Created Successfully!', "\n"
  end

  def create_rental(date:, book:, person:)
    @rentals.push(Rental.new(date, book, person))
    puts 'Rental Created Successfully!', "\n"
  end

  def list_rental(person_id)
    @rentals.each do |x|
      return x if(x.person.id == person_id) 
    end
  end
end
