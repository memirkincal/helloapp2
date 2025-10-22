class Exam < ApplicationRecord
  belongs_to :course
  has_many :grades, dependent: :destroy

  validates :date, :exam_type, :max_score, presence: true
end
