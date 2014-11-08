class Viewer < ActiveRecord::Base
	has_many :option_select_logs
  	has_many :options, through: :option_select_logs
  	has_many :quiz_view_logs
  	has_many :quizzes, through: :quiz_view_logs
  	has_many :result_view_logs
  	has_many :results, through: :result_view_logs
end
