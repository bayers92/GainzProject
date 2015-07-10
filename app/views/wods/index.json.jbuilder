json.array!(@wods) do |wod|
  json.extract! wod, :id, :description, :result_label, :workout_id
  json.url wod_url(wod, format: :json)
end
