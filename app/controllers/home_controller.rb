class HomeController < ApplicationController
  def index
       if params.has_key? 'post_id' 
      	redirect_to '/posts/'+params['post_id']
      	return
  	end
      
  end

end
