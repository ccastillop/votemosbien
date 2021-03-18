class AnswerLine < ApplicationRecord
  belongs_to :answer
  belongs_to :option
  belongs_to :question
  validates :option_id, presence: true
end
