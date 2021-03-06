class Subject < ApplicationRecord
  has_many :students
  has_one :exam
  has_many :subject_type
  has_many :subject_teachers
  has_many :teachers, through: :subject_teachers
  validates :teacher_id, :subject_name, presence: true
end