class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.text :name
      t.integer :quizzes_viewed
      t.integer :questions_viewed

      t.timestamps
    end
  end
end
