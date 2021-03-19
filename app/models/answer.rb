class Answer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answer_lines, dependent: :destroy
  accepts_nested_attributes_for :answer_lines

  def completed?
    answer_lines.size == Question.count &&
      answer_lines.all?(&:valid?)
  end

  def value_x
    answer_lines.sum{ |l| l.value_x || 0 }
  end

  def value_y
    answer_lines.sum{ |l| l.value_y || 0 }
  end
end
