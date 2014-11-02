class AddResultPrefixToQuizzes < ActiveRecord::Migration
  def change
  	remove_column :results, :title_prefix
  	add_column :quizzes, :title_prefix, :string
  end
end
