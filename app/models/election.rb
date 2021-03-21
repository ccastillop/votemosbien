class Election < ApplicationRecord
  has_many :candidates
  validates :name, presence: true

  ELECTIONS = {
    presidencia: [3, 4, 5],
    congreso: [1],
    parlamento_andino: [2]
  }

  ELECTIONS.each do |k, v|
    scope k, -> { where(id: v) }
  end

  def to_s
    name
  end
end
