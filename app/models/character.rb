class Character < ActiveRecord::Base
    belongs_to :actor 
    belongs_to :show 

    def say_that_thing_you_say
        self.name + " always says: " + self.catchphrase 
    end 

    def build_show(name:)
        attached_show = Show.create(:name => name) 
        attached_show.characters << self 
        self.show = attached_show
        attached_show 
    end 
end