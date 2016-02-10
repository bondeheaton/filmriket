json.array!(@presses) do |press|
  json.extract! press, :id, :text, :link
  json.url press_url(press, format: :json)
end
