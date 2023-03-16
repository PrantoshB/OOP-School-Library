require './classroom'

describe Classroom do
  classroom = Classroom.new('Math')
  context 'should create instance of Classroom Class' do
    it 'returns correct label' do
      expect(classroom.label).to eq('Math')
    end
  end
end
