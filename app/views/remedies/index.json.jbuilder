json.array!(@remedies) do |remedy|
  json.extract! remedy, :id, :quantidade, :name, :user_id
  json.url user_remedies_url(remedy, format: :json)
end
