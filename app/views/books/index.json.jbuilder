json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :borrowed_to_id
  json.url book_url(book, format: :json)
end
