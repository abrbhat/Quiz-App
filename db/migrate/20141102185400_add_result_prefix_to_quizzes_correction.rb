class AddResultPrefixToQuizzesCorrection < ActiveRecord::Migration
  def change
  	remove_column :quizzes, :title_prefix
  	add_column :quizzes, :result_prefix, :string
  end
end
