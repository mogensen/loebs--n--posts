#encoding: utf-8
class Loeb < ActiveRecord::Base
    has_many :posts
    
    #Need to figure how to do this in rails 3
    #HUMANIZED_ATTRIBUTES = {
    #    :custom_id => "E-mail address"
    #}
    #def self.human_attribute_name(attr, number=1)
    #    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    #end
    validates :name, :presence => {:message =>" skal være der"}, :length => { :maximum => 100 }
    validates :contact, :presence => {:message =>" skal være der"}
    validates :custom_id, :presence => {:message =>"løbs id skal være der"}, :uniqueness => {:message =>"løbs id er ikke unikt. Prøv et andet."}, :length => { :maximum => 100 }
    
    validates_datetime :start, :before => :slut, :before_message => "må ikke ligge efter slut"
    validates_datetime :slut, :after => :start, :after_message => "må ikke ligge før start"
    
end
