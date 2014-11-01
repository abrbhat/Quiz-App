class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :title
      t.references :question, index: true
      t.integer :selection_count

      t.timestamps
    end
  end
end
