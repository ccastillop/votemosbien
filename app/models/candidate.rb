class Candidate < ApplicationRecord
  belongs_to :region, optional: true
  belongs_to :party
  belongs_to :election
  validates :dni, :names, :father_surname, presence: true
end
