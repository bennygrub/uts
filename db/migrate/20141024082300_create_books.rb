class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.datetime :publication_year
      t.string :book_title
      t.string :book_edition
      t.string :publisher_name
      t.string :publisher_city

      t.timestamps
    end
  end
end
