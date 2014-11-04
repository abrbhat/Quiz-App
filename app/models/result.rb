class Result < ActiveRecord::Base
	belongs_to :quiz
	has_many :options
	has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>", :small => "240x240"}, :default_url => "/images/:style/missing.png"
 	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
