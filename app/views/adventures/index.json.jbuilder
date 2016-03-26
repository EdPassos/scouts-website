json.array!(@adventures) do |adventure|
  json.extract! adventure, :id, :name, :start, :end, :photo_album_id, :post_id
  json.url adventure_url(adventure, format: :json)
end
