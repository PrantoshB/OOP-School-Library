require './person'
require './student'

describe Student do
  student = Student.new(18, 'John', parent_permission: true)

  context 'should create instance of Student Class' do
    it 'returns correct name' do
      expect(student.name).to eq('John')
    end

    it 'returns correct age' do
      expect(student.age).to eq(18)
    end

    it 'should return correct data' do
      expect(student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
