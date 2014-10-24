json.array!(@journal_authors) do |journal_author|
  json.extract! journal_author, :id, :journal_id, :first_name, :last_name
  json.url journal_author_url(journal_author, format: :json)
end
