class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.datetime :publication_year
      t.string :book_name
      t.string :book_edition
      t.string :chapter_title
      t.string :publisher_name
      t.string :publisher_city
      t.string :page_range_start
      t.string :page_range_end

      t.timestamps
    end
  end
end
