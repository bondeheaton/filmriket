json.array!(@competition_results) do |competition_result|
  json.extract! competition_result, :id, :user_id, :competition_id, :score, :answers
  json.url competition_result_url(competition_result, format: :json)
end
