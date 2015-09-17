json.array!(@filmschools) do |filmschool|
  json.extract! filmschool, :id, :title, :description, :videolink
  json.url filmschool_url(filmschool, format: :json)
end
