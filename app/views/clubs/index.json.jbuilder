json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :description, :address, :zipcode
  json.url club_url(club, format: :json)
end
