json.array!(@insulines) do |insuline|
  json.extract! insuline, :id, :name, :unit, :date, :note, :user_id
  json.url insuline_url(insuline, format: :json)
end
