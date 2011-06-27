class Loeb < ActiveRecord::Base
    has_many :posts
    
    validates :custom_id, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
    validates :name, :presence => true, :length => { :maximum => 100 }
    validates :contact, :presence => true
    
    validates_datetime :start, :before => :slut
    validates_datetime :slut, :after => :start
    
end
