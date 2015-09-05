json.array!(@bookings) do |booking|
  json.extract! booking, :id, :user_id, :movie_id, :status
  json.url booking_url(booking, format: :json)
end
