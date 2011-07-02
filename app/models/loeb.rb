#encoding: utf-8
class Loeb < ActiveRecord::Base
    cattr_reader :per_page
    @@per_page = 5
    
    has_many :posts
    has_many :teams
    
    validates :name, :presence => {:message =>" skal være der"}, :length => { :maximum => 100 }
    validates :contact, :presence => {:message =>" skal være der"}
    validates :custom_id, :presence => {:message =>"kode skal være der"}, :uniqueness => {:message =>"løbs id er ikke unikt. Prøv et andet."}, :length => { :maximum => 100 }
    
    validates_datetime :start, :before => :slut, :before_message => "må ikke ligge efter slut"
    validates_datetime :slut, :after => :start, :after_message => "må ikke ligge før start"
    
end
