class Student < ApplicationRecord
  has_many :grades, dependent: :destroy
  has_many :exams, through: :grades

  validates :name, :student_number, :email, presence: true
  validates :student_number, uniqueness: true
  validates :email, uniqueness: true
end
