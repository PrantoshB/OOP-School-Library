require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require './data/preservedata'

class App
  def initialize
    @people = load_data('./data/people.json') || []
    @books = []
    @rentals = []
  end

  def list_books
    @books = load_data('./data/books.json')
    if @books.empty?
      puts 'There are no books yet'
      return
    end

    @books.each do |book|
      puts "Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  def display_people
    @people.each_with_index do |p, index|
      puts "#{index + 1} [#{p.class}] | ID: #{p.id} - Name: #{p.name} - Age: #{p.age}"
    end
  end

  def list_people
    @people = load_data('./data/people.json')
    if @people.empty?
      puts 'There is no people'
    else
      @people.each do |person|
        puts "Name: #{person['name']} ID: #{person['id']} Age: #{person['age']}"
      end
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
    save_data(@people, './data/people.json')
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
    save_data(@people, './data/people.json')
    puts 'Teacher Created Successfully'
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

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    save_data(@books, './data/books.json')

    puts 'Book created successfully'
  end

  def create_rental
    @books = load_data('./data/books.json')
    @people = load_data('./data/people.json')
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'

      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      save_data(@rentals, './data/rentals.json')
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    @rentals = load_data('./data/rentals.json')
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental['person']['id'] == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental['date']}, Book '#{rental['book']['title']}' by #{rental['book']['author']}"
    end
  end
end
