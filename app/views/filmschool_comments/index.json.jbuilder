json.array!(@filmschool_comments) do |filmschool_comment|
  json.extract! filmschool_comment, :id, :message, :user_id, :filmschool_id
  json.url filmschool_comment_url(filmschool_comment, format: :json)
end
