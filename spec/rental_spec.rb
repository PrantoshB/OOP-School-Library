require './rental'
require './book'
require './person'

describe Rental do
  book = Book.new('Harry Potter', 'J.K. Rowling')
  date = '12/02/2023'
  person = Person.new(20, 'Jimmy')
  rental = Rental.new(date, book, person)

  context 'should create instance of rental class for student' do
    it 'returns correct date' do
      expect(rental.date).to eq('12/02/2023')
    end

    it 'returns correct book title' do
      expect(rental.book.title).to eq('Harry Potter')
    end

    it 'returns correct book author' do
      expect(rental.book.title).to eq('Harry Potter')
    end

    it 'returns correct person age' do
      expect(rental.person.age).to eq(20)
    end

    it 'returns correct person name' do
      expect(rental.person.name).to eq('Jimmy')
    end

    it 'returns correct person parent permission' do
      expect(rental.person.can_use_services?).to eq true
    end
  end
end
