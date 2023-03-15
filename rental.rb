class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @person['rentals'] << self
    @book['rentals'] << self
  end

  attr_accessor :date, :book, :person

  def to_h
    {
      date: @date,
      book: @book.to_h,
      person: @person.to_h
    }
  end
end
