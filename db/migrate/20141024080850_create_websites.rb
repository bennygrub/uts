class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :website_title
      t.datetime :copyright
      t.string :article_title
      t.string :publication_title
      t.datetime :date_viewed
      t.text :url

      t.timestamps
    end
  end
end
