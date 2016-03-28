json.array!(@camp_nights) do |camp_night|
  json.extract! camp_night, :id, :adventure_id, :person_id, :nights
  json.url camp_night_url(camp_night, format: :json)
end
