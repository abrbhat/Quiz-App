class AddDescriptionAndImageToQuiz < ActiveRecord::Migration
  def change
  	add_column :quizzes, :description, :text
	add_attachment :quizzes, :image
  end
end
