class Party < ApplicationRecord
  has_many :candidates
  has_one :answer, as: :answerer
  validates :name, presence: true
  has_one_attached :logo

  def to_s
    name
  end
end
