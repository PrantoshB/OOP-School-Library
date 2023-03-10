require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      option = gets.chomp

      case option
      when '1'
        list_books
      when '2'
        list_people
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        list_rentals
      when '7'
        break
      else
        puts 'That is not a valid option'
      end

      puts ' '

      puts 'Press any key to continue'
      gets.chomp
    end

    puts 'Thank you for using this app!'
  end

  def list_books
    if @books.empty?
      puts 'There are no books yet'
      return
    end

    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts 'There is no people'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    input_result = gets.chomp.to_i

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Has Parent permission? [Y/N]'
    permission = gets.chomp

    student = Student.new(age, name, parent_permission: permission)
    @people.push(student)
    puts 'Student Created Successfully'
  end

  def create_teacher
    print 'Specialization:'
    specialization = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    @people << Teacher.new(age, name, specialization: specialization)
    puts 'Teacher Created Successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
