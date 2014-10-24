class CreateChapterAuthors < ActiveRecord::Migration
  def change
    create_table :chapter_authors do |t|
      t.integer :chapter_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
