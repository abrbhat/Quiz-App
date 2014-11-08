class CreateResultViewLogs < ActiveRecord::Migration
  def change
    create_table :result_view_logs do |t|
      t.integer :result_id
      t.integer :viewer_id

      t.timestamps
    end
  end
end
