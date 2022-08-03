require 'pry'
require_relative 'app'
require_relative 'book'

@options = [
  '1 - List all books',
  '2 - List all people',
  '3 - Create a person',
  '4 - Create a book',
  '5 - Create a rental',
  '6 - List all rentals for a given person',
  '7 - Exit'
]

@app = App.new
@exit_selection = false

def display_create_person()
  puts 'Do you want to create a student (1) or a teacher(2)? [Input the number]:'
  choice = gets.to_i
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  case choice
  when 1
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.casecmp?('y')
    @app.create_person(type: choice, age: age, name: name, parent_permission: parent_permission)
  when 2
    print 'Specializaiton: '
    specialization = gets.chomp
    @app.create_person(type: choice, age: age, name: name, specialization: specialization)
  else
    puts 'Wrong choice selection'
  end
end

def display_create_book()
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  @app.create_book(title: title, author: author)
end

def display_create_rental()
  puts 'Select a book from the following list by number (not id)'
  index = 0
  ObjectSpace.each_object(Book) do |x|
    puts "(#{index}) Title: #{x.title}, Author: #{x.author}"
    index = + 1
  end
  book_choice = gets.to_i
  puts "\n"
  puts 'Select a person from the following list by number (not id)'
  index = 0
  ObjectSpace.each_object(Person) do |x|
    puts "(#{index}) [#{x.class}] Name: #{x.name}, ID: #{x.age}, Age: #{x.age}"
    index = + 1
  end
  person_choice = gets.to_i
  print 'Date: '
  date = gets.chomp
  @app.create_rental(date: date, book: @app.books[book_choice], person: @app.persons[person_choice])
end

def rental_by_person_id
  print 'ID of person : '
  id = gets.to_i
  rentals = @app.list_rental(id)
  rentals.each do |x|
    puts "Date : #{x.date}, Book \"#{x.book.title}\" by #{x.book.author} "
  end
end

def main
  until @exit_selection
    puts 'Please choose an option by entering a number'
    @options.each { |item| puts item }
    number = gets.to_i
    case number
    when 2
      @app.list_persons
    when 3
      display_create_person
    when 4
      display_create_book
    when 5
      display_create_rental
    when 6
      rental_by_person_id
    when 7
      @exit_selection = true
    else
      puts 'Wrong choice'
    end
  end
end

main
