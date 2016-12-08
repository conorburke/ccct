class Group < ApplicationRecord
  has_many :students
  belongs_to :idea
  has_one :cohort, through: :students

  validates :name, presence: true
end
