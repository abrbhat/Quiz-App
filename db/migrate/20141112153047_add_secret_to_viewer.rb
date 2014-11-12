class AddSecretToViewer < ActiveRecord::Migration
  def change
  	add_column :viewers, :secret, :string
  end
end
