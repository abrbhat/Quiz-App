class AddDescriptionAndImageToResult < ActiveRecord::Migration
  def change
  	add_column :results, :title, :text
  	add_column :results, :description, :text
  	add_column :results, :viewings, :integer
  	add_column :results, :quiz_id, :integer
  	add_attachment :results, :image
  end
end
