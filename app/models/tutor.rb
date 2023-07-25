class Tutor < ApplicationRecord
  belongs_to :course
  validates :name, :experience, presence: true
end
