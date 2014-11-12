class Viewer < ActiveRecord::Base
	has_many :option_select_logs
  	has_many :options, through: :option_select_logs
  	has_many :quiz_view_logs
  	has_many :quizzes, through: :quiz_view_logs
  	has_many :result_view_logs
  	has_many :results, through: :result_view_logs
  	after_initialize :init

    def init
      	o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		secret_string = (0...50).map { o[rand(o.length)] }.join
      	self.secret ||= secret_string #let's you set a default association
    end
end
