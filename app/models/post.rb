class Post < ActiveRecord::Base
    belongs_to :loeb
    
    cattr_reader :per_page
    @@per_page = 10
end
