class CreateBookAuthors < ActiveRecord::Migration
  def change
    create_table :book_authors do |t|
      t.integer :book_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
