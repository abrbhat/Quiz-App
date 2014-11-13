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

        names = ['Sophia','Emma','Olivia','Isabella','Ava','Mia','Emily','Abigail','Madison','Elizabeth','Charlotte','Avery','Sofia','Chloe','Ella','Harper','Amelia','Aubrey','Addison','Evelyn','Natalie','Grace','Hannah','Zoey','Victoria','Lillian','Lily','Brooklyn','Samantha','Layla','Zoe','Audrey','Leah','Allison','Anna','Aaliyah','Savannah','Gabriella','Camila','Aria','Kaylee','Scarlett','Hailey','Arianna','Riley','Alexis','Nevaeh','Sarah','Claire','Sadie','Peyton','Aubree','Serenity','Ariana','Genesis','Penelope','Alyssa','Bella','Taylor','Alexa','Kylie','Mackenzie','Caroline','Kennedy','Autumn','Lucy','Ashley','Madelyn','Violet','Stella','Brianna','Maya','Skylar','Ellie','Julia','Sophie','Katherine','Mila','Khloe','Paisley','Annabelle','Alexandra','Nora','Melanie','London','Gianna','Naomi','Eva','Faith','Madeline','Lauren','Nicole','Ruby','Makayla','Kayla','Lydia','Piper','Sydney','Jocelyn','Morgan']
        pre_names = ['cute','pretty','sweet', 'beautiful','gorgeous','nice','charming']

        chosen_name = "#{pre_names.sample}_#{names.sample.downcase}"
        self.name ||= chosen_name
    end
end
