require './person'
require './teacher'

describe Teacher do
  teacher = Teacher.new(30, 'Prantosh', specialization: 'Math')

  context 'should create instance of Teacher Class' do
    it 'returns correct name' do
      expect(teacher.name).to eq('Prantosh')
    end

    it 'returns correct age' do
      expect(teacher.age).to eq(30)
    end

    it 'should return correct data' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
