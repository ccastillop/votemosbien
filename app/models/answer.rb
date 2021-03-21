class Answer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :answerer, polymorphic: true, optional: true
  has_many :answer_lines, dependent: :destroy
  accepts_nested_attributes_for :answer_lines

  def completed?
    pending_count == 0
  end

  def value_x
    answer_lines.sum{ |l| l.value_x || 0 }
  end

  def value_y
    answer_lines.sum{ |l| l.value_y || 0 }
  end

  def answered_count
    AnswerLine.where(answer_id: id).count
  end

  def pending_count
    Question.count - answered_count
  end
end
