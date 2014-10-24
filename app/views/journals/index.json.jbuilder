json.array!(@journals) do |journal|
  json.extract! journal, :id, :publication_year, :article_title, :journal_title, :journal_volume, :journal_number, :page_range_start, :page_range_end
  json.url journal_url(journal, format: :json)
end
