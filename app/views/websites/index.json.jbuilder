json.array!(@websites) do |website|
  json.extract! website, :id, :website_title, :copyright, :article_title, :publication_title, :date_viewed, :url
  json.url website_url(website, format: :json)
end
