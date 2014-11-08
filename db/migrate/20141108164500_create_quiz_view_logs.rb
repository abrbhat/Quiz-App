class CreateQuizViewLogs < ActiveRecord::Migration
  def change
    create_table :quiz_view_logs do |t|
      t.integer :quiz_id
      t.integer :viewer_id

      t.timestamps
    end
  end
end
