class AddResultIdToOption < ActiveRecord::Migration
  def change
  	add_column :options, :result_id, :integer
  end
end
