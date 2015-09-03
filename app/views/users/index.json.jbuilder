json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :personalnumber, :phonenumber, :avatar, :adress, :city, :zipcode, :parentmail, :access
  json.url user_url(user, format: :json)
end
