json.array!(@reviews) do |review|
  json.extract! review, :id, :title, :description, :videolink, :active, :user_id
  json.url review_url(review, format: :json)
end
