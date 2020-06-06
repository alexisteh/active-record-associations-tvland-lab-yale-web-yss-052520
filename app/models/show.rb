class Show < ActiveRecord::Base
    has_many :characters 
    has_many :actors, through: :characters 
    belongs_to :network 
  
    def build_network(call_letters:)
        attached_network = Network.new(call_letters: call_letters)
        attached_network.shows << self 
        self.network = attached_network 
        attached_network
    end 

    def actors_list 
        self.actors.map(&:full_name)
    end 

end