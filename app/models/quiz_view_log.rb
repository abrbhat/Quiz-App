class QuizViewLog < ActiveRecord::Base
	belongs_to :quiz
  	belongs_to :viewer
end
