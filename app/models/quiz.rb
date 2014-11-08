class Quiz < ActiveRecord::Base
	has_many :questions
	has_many :results
	has_attached_file :image, :styles => { :medium => "260x260>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	has_many :quiz_view_logs
  	has_many :viewers, through: :quiz_view_logs
end
