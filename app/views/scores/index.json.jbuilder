json.array!(@scores) do |score|
  json.extract! score, :id, :result, :user_id, :lift_id, :wod_id
  json.url score_url(score, format: :json)
end
