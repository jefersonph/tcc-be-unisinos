json.array!(@diseases) do |disease|
  json.extract! disease, :id, :name, :user_id
  json.url user_diseases_url(disease, format: :json)
end
