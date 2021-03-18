class Answer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answer_lines, dependent: :destroy
  accepts_nested_attributes_for :answer_lines
end
