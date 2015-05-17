json.array!(@results) do |result|
  json.extract! result, :id, :hb, :hb, :note, :date
  json.url result_url(result, format: :json)
end
