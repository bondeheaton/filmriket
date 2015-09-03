json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :description, :director, :genre, :playtime, :published, :imglink, :trailerlink
  json.url movie_url(movie, format: :json)
end
