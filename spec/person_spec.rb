require './person'


describe Person do
  person = Person.new(20, 'Mark')

  context 'should create instance of Person Class' do
    it 'returns correct name' do
      expect(person.name).to eq('Mark')
    end

    it 'returns correct age' do
      expect(person.age).to eq(20)
    end

    it 'should return correct data' do
      expect(person.can_use_services?).to eq true
    end
  end
end
