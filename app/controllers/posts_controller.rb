#encoding: utf-8

class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
      redirect_to '/'
      return
      
#    @posts = Post.all

#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @posts }
#    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
      if params.has_key? :team_id
          team = Team.where(:code => params[:team_id][:team_id]).first
          session[:team_id] = team.id
      end
      begin
          @post = Post.find(params[:id])
          respond_to do |format|
              format.html # show.html.erb
              format.xml  { render :html => @post }
          end
      rescue 
          render 'public/404', :status => 404, :layout => false
      end
  end

  def answer
    @post = Post.find(params[:postid])
    #See if it is there allreday
    as = Answer.where(:loeb_id => @post.loeb_id, :post_id => @post.id, :team_id => session[:team_id])
    if not as.nil? and as.length > 0
        a = as.first
        a.answers += ', '+params[:answer]
        a.no_of_answers += 1
    else
        a = Answer.new
        a.loeb_id = @post.loeb_id
        a.post_id = @post.id
        a.team_id = session[:team_id]
        a.answers = params[:answer]
        a.no_of_answers = 1
    end
    a.save
    respond_to do |format|
      format.html # answer.html.erb
      format.xml  { render :html => @post }
    end
  end


  # GET /posts/new
  # GET /posts/new.xml
  def new
    @loebs = Loeb.all.map { |loeb| [loeb.name, loeb.id] }
    @post = Post.new
    @type = "normal"
    @type = params[:type] if params.has_key? "type"
    @loeb_id = params[:loeb]
    if session[:loebs_id].to_i != @loeb_id.to_i   
        session[:loebs_id] = nil    
        redirect_to '/', :notice => "Du har ikke adgang her."
        return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :html => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @loeb_id = @post.loeb_id
    @loebs = Loeb.all.map { |loeb| [loeb.name, loeb.id] }
    @type = @post.post_type
    if session[:loebs_id].to_i != @loeb_id.to_i   
        session[:loebs_id] = nil    
        redirect_to '/', :notice => "Du har ikke adgang her."
        return
    end
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @loeb_id = @post.loeb_id
    @loeb = Loeb.find(@loeb_id)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@loeb, :notice => 'Posten blev oprettet.') }
        #format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :html => @post }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    @loeb_id = @post.loeb_id
    @loeb = Loeb.find(@loeb_id)

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@loeb, :notice => 'Posten blev opdateret.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :html => @post }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @loeb_id = @post.loeb_id
    @loeb = Loeb.find(@loeb_id)
    if session[:loebs_id].to_i != @post.loeb_id.to_i   
        session[:loebs_id] = nil    
        redirect_to '/', :notice => "Du har ikke adgang her."
        return
    end
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(@loeb, :notice => 'Posten blev slettet') }
      format.xml  { head :ok }
    end
  end
end
