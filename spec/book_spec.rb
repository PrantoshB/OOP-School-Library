require './book'

describe Book do
  book = Book.new('Harry Potter', 'J.K. Rowling')

  context 'should create instance of Book Class' do
    it 'returns correct title' do
      expect(book.title).to eq('Harry Potter')
    end

    it 'returns correct author' do
      expect(book.author).to eq('J.K. Rowling')
    end
  end
end
