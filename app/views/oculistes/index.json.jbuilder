json.array!(@oculistes) do |oculiste|
  json.extract! oculiste, :id, :rdv, :note
  json.url oculiste_url(oculiste, format: :json)
end
