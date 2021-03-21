class CandidateFilter
  include ActiveModel::Model
  attr_accessor :terms, :region_ids, :party_ids, :election_ids

  def initialize(attributes={})
    super
    @region_ids     ||= []
    @region_ids     = @region_ids.select(&:present?)
    @party_ids     ||= []
    @party_ids     = @party_ids.select(&:present?)
    @election_ids     ||= []
    @election_ids     = @election_ids.select(&:present?)
  end

  def filter(candidates)
    candidates = candidates.where(region_id: region_ids) if region_ids.present?
    candidates = candidates.where(party_id: party_ids) if party_ids.present?
    candidates = candidates.where(election_id: election_ids) if election_ids.present?
 
    if terms && terms.size > 1
      candidates = candidates.where("( unaccent(candidates.names) ilike unaccent(:terms) OR
        unaccent(candidates.father_surname) ilike unaccent(:terms) OR
        unaccent(candidates.mother_surname) ilike unaccent(:terms) OR
        unaccent(candidates.dni) ilike unaccent(:terms) )", terms: "%#{terms}%")
    end
    candidates
  end
  
end