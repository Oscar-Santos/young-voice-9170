class Student <ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :professor_students
  has_many :professors, through: :professor_students

  def number_of_professors
    professors.count
  end
end
