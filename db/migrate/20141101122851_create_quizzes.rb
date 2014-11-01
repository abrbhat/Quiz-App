class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.text :title
      t.integer :view_count

      t.timestamps
    end
  end
end
