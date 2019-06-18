class Student < ApplicationRecord
  belongs_to :school
  validates :student_id, :presence => true
  validates :name, :presence => true
  validates :sex, :presence => true

  paginates_per 50

end
