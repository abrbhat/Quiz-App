class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.references :quiz, index: true
      t.integer :view_count

      t.timestamps
    end
  end
end
