class ResultViewLog < ActiveRecord::Base
	belongs_to :result
  	belongs_to :viewer
end
