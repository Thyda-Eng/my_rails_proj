class StudentPerformance < ApplicationRecord
  belongs_to :student
  validates_inclusion_of :score, :in => 1..10


  SEMESTER = [1,2]
  GRADE = [1,2,3,4,5,6]
  SCHOOL_YEAR = ["2018-2019", "2019-2020"]
  SUBJECT = ["Mathematics", "Khmer Literature", "Social Study"]

  def self.by(student_id, year, semester, subject)
    self.find_by(student_id: student_id, school_year: year, semester: semester, subject: subject)
  end
end
