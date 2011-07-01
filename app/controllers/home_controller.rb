class HomeController < ApplicationController
  def index
    if params.has_key? 'post_id' 
      	redirect_to '/posts/'+params['post_id']
      	return
  	elsif params.has_key? 'custom_loeb_id'
  	    redirect_to '/loebs/custom_id/'+params['custom_loeb_id']
  	    return
  	end
  	
  	#@loebs = Loeb.where("slut >= '#{Time.now}'").paginate( :page => params[:page], :per_page => 5, :order => :start)
  	@loebs = Loeb.all(:order => "start DESC, slut DESC").paginate( :page => params[:page], :per_page => 5)
  end

  def about
  end

end
