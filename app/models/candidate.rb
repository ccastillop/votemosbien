class Candidate < ApplicationRecord
  belongs_to :region, optional: true
  belongs_to :party
  belongs_to :election
  belongs_to :user, optional: true
  has_one :answer, as: :answerer
  
  validates :dni, :names, :father_surname, presence: true

  def full_name
    [names, father_surname, mother_surname].join(" ")
  end

  def to_s
    full_name
  end

  def description
    "#{self} postula a #{election} Nº#{number} por #{party} #{ "en #{region}" if region.present? }"
  end
  
end
