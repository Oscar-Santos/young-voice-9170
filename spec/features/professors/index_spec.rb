require 'rails_helper'

# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
RSpec.describe 'professor index' do
  it 'displays list of professors with their attributes' do
    professor_1 = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    professor_2 = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    professor_3 = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'
    expect(page).to have_content(professor_1.name)
    expect(page).to have_content(professor_1.age)
    expect(page).to have_content(professor_1.specialty)
  end
end
