json.array!(@administrators) do |administrator|
  json.extract! administrator, :id, :name, :email, :password
  json.url administrator_url(administrator, format: :json)
end
