require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    it 'displays the average age of all students for that professor' do
      professor_1 = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      student_1 = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      student_3 = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: student_1.id, professor_id: professor_1.id)
      ProfessorStudent.create(student_id: student_3.id, professor_id: professor_1.id)
      expect(professor_1.average_age_of_students).to eq(11)
    end
  end
end
