class CreateJournalAuthors < ActiveRecord::Migration
  def change
    create_table :journal_authors do |t|
      t.integer :journal_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
