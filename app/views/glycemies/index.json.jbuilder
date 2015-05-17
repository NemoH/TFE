json.array!(@glycemies) do |glycemy|
  json.extract! glycemy, :id, :valeur, :note, :user_id, :date
  json.url glycemy_url(glycemy, format: :json)
end
