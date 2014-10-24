class ChangePublicationTitleName < ActiveRecord::Migration
  def change
  	rename_column :websites, :publication_title, :publication_city
  end
end
