class AddStoreProductToOption < ActiveRecord::Migration
  def change
  	add_column :options, :store_product, :boolean
  	add_column :options, :store_link, :text
  	add_column :options, :store_name, :string
  	add_column :options, :store_price, :string
  end
end
