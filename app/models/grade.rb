class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :exam

  validates :score, presence: true, numericality: { only_integer: true }
end
