class Party < ApplicationRecord
  has_many :candidates
  validates :name, presence: true

  def to_s
    name
  end
end
