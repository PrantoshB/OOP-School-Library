require './app'
require './options'

def main
  app = App.new
  loop do
    choose(app)
  end
end

def choose(app)
  option = Options.new
  option.print_options
  input = gets.chomp
  case input
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  else
    exit_app
  end
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

main
