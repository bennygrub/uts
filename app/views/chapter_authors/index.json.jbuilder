json.array!(@chapter_authors) do |chapter_author|
  json.extract! chapter_author, :id, :chapter_id, :first_name, :last_name
  json.url chapter_author_url(chapter_author, format: :json)
end
