class AddExpiryDateToStoreProduct < ActiveRecord::Migration
  def change
  	add_column :options, :store_product_expiry_date, :date
  end
end
