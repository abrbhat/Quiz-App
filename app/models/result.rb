class Result < ActiveRecord::Base
	belongs_to :quiz
	has_many :options
	has_attached_file :image, :styles => { :medium => "300x400>", :thumb => "75x100>" }, :default_url => "/images/:style/missing.png"
 	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
