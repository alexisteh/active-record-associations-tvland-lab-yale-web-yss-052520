class Actor < ActiveRecord::Base
    has_many :characters 
    has_many :shows, through: :characters 

    def full_name 
        self.first_name + " " + self.last_name 
    end 
    
    def list_roles 
        self.characters.map{|one_character| one_character.name + " - " + one_character.show.name}
    end 
end