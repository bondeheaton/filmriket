json.array!(@movie_comments) do |movie_comment|
  json.extract! movie_comment, :id, :message, :user_id, :movie_id
  json.url movie_comment_url(movie_comment, format: :json)
end
