json.array!(@medecins) do |medecin|
  json.extract! medecin, :id, :rdv, :note
  json.url medecin_url(medecin, format: :json)
end
