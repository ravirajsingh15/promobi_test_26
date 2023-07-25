class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy
  validates :name, :subject, presence: true
  accepts_nested_attributes_for :tutors
  validates_associated :tutors
end
