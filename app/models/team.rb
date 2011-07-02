#encoding: utf-8
class Team < ActiveRecord::Base
    belongs_to :loeb
    
    validates :name, :presence => {:message =>" skal være der"}, :length => { :maximum => 100 }, :uniqueness => {:scope => :loeb_id}
    validates :contact, :presence => {:message =>" skal være der"}
    validates :code, :presence => {:message =>" skal være der"}, :uniqueness => {:scope => :loeb_id}
end
