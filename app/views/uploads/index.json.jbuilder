json.array!(@uploads) do |upload|
  json.extract! upload, :id, :club_id
  json.url upload_url(upload, format: :json)
end
