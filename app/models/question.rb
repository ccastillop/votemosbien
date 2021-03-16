class Question < ApplicationRecord
  validates :name, presence: true
  has_many :options, dependent: :destroy
  
  def to_s
    name
  end
end
