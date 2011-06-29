class HomeController < ApplicationController
  def index
    if params.has_key? 'post_id' 
      	redirect_to '/posts/'+params['post_id']
      	return
  	elsif params.has_key? 'custom_loeb_id'
  	    redirect_to '/loebs/custom_id/'+params['custom_loeb_id']
  	    return
  	end
  	
  	@loebs = Loeb.all(:conditions => [" slut >= '#{Time.now}'"],:order => :start, :limit => 10)
  end

  def about
  end

end
