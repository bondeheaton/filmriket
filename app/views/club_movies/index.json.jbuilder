json.array!(@club_movies) do |club_movie|
  json.extract! club_movie, :id, :title, :description, :videolink, :active, :user_id
  json.url club_movie_url(club_movie, format: :json)
end
