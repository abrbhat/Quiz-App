class Option < ActiveRecord::Base
	belongs_to :question
	belongs_to :result
	has_attached_file :content, :styles => { :medium => "200x200>", :thumb => "100x100>", :large => "300x300>" }, :default_url => "/images/:style/missing.png"
 	validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
end
