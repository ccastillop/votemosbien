class AnswerLine < ApplicationRecord
  belongs_to :answer
  belongs_to :option
  belongs_to :question
  validates :option_id, presence: true

  before_save do
    Rails.logger.info option.value_x + option.value_y
    self.value_x = option.value_x
    self.value_y = option.value_y
  end
end
