json.array!(@users) do |user|
  json.extract! user, :id, :email, :sangue, :peso, :altura, :pressao
  json.url user_url(user, format: :json)
end
