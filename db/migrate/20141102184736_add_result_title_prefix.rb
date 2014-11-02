class AddResultTitlePrefix < ActiveRecord::Migration
  def change
  	add_column :results, :title_prefix, :string
  end
end
