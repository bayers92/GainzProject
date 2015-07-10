json.array!(@workouts) do |workout|
  json.extract! workout, :id, :title, :admin_id
  json.url workout_url(workout, format: :json)
end
