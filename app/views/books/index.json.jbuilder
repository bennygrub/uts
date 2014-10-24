json.array!(@books) do |book|
  json.extract! book, :id, :publication_year, :book_title, :book_edition, :publisher_name, :publisher_city
  json.url book_url(book, format: :json)
end
