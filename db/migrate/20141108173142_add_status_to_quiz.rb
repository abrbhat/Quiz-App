class AddStatusToQuiz < ActiveRecord::Migration
  def change
  	add_column :quizzes, :status, :string
  end
end
