class Teacher < ApplicationRecord
  has_many :courses, dependent: :nullify

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
