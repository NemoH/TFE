json.array!(@prisedesangs) do |prisedesang|
  json.extract! prisedesang, :id, :rdv, :note
  json.url prisedesang_url(prisedesang, format: :json)
end
