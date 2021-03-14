json.extract! question, :id, :name, :description, :created_at, :updated_at
json.url question_url(question, format: :json)
