class OptionSelectLog < ActiveRecord::Base
	belongs_to :option
  	belongs_to :viewer
end
