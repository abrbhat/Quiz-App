class Option < ActiveRecord::Base
	belongs_to :question
	attr_accessible :content
	has_attached_file :content, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 	validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
end
