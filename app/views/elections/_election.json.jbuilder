json.extract! election, :id, :name, :due_date, :created_at, :updated_at
json.url election_url(election, format: :json)
