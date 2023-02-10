class Course < ApplicationRecord
  has_many :resident_courses
  has_many :residents, through: :resident_courses
  validates :name, presence: true

  def count_courses
   self.residents.size
  end
end
