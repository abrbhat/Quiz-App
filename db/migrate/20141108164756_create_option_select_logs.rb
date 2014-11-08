class CreateOptionSelectLogs < ActiveRecord::Migration
  def change
    create_table :option_select_logs do |t|
      t.integer :option_id
      t.integer :viewer_id

      t.timestamps
    end
  end
end
