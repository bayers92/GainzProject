json.array!(@lifts) do |lift|
  json.extract! lift, :id, :type, :description, :rep_count, :workout_id
  json.url lift_url(lift, format: :json)
end
