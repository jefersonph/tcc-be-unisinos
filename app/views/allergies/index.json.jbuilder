json.array!(@allergies) do |allergy|
  json.extract! allergy, :id, :name, :user_id
  json.url user_allergies_url(allergy, format: :json)
end
