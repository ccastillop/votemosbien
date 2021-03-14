class Option < ApplicationRecord
  belongs_to :question
  validates :name, :value_x, :value_y, presence: true
  
  def to_s
    name
  end
end
