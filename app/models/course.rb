class Course < ApplicationRecord
  belongs_to :teacher, optional: true
  has_many :exams, dependent: :destroy

  validates :course_name, :course_code, presence: true
  validates :course_code, uniqueness: true
end
