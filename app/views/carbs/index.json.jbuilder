json.array!(@carbs) do |carb|
  json.extract! carb, :id, :valeur, :note, :date
  json.url carb_url(carb, format: :json)
end
