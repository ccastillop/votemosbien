json.extract! candidate, :id, :dni, :names, :father_surname, :mother_surname, :number, :region_id, :party_id, :status, :election_id, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
