class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.datetime :publication_year
      t.string :article_title
      t.string :journal_title
      t.string :journal_volume
      t.string :journal_number
      t.string :page_range_start
      t.string :page_range_end

      t.timestamps
    end
  end
end
