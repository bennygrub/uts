json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :publication_year, :book_name, :book_edition, :chapter_title, :publisher_name, :publisher_city, :page_range_start, :page_range_end
  json.url chapter_url(chapter, format: :json)
end
