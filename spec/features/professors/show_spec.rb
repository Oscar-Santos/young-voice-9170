require 'rails_helper'

RSpec.describe 'professors show' do
  it 'displays a list of the names of the students the professors have ' do
    professor_1 = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    professor_2 = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    professor_3 = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    student_1 = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    student_2 = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    student_3 = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: student_1.id, professor_id: professor_1.id)
    ProfessorStudent.create(student_id: student_1.id, professor_id: professor_2.id)
    ProfessorStudent.create(student_id: student_1.id, professor_id: professor_3.id)
    ProfessorStudent.create(student_id: student_2.id, professor_id: professor_2.id)
    ProfessorStudent.create(student_id: student_2.id, professor_id: professor_3.id)
    ProfessorStudent.create(student_id: student_3.id, professor_id: professor_1.id)

    visit "/professors/#{professor_1.id}"
    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_3.name)
    expect(page).to_not have_content(student_2.name)
  end
end
