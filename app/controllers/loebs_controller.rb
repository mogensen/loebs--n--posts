#encoding: utf-8

require 'csv'

class LoebsController < ApplicationController
  # GET /loebs
  # GET /loebs.xml
  def index
      if not params.has_key? "davse_er_kool"
          redirect_to '/'
          return
      end
      
    @loebs = Loeb.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :html => @loebs }
    end
  end

  # GET /loebs/1
  # GET /loebs/1.xml
  def show
      begin
          @loeb = Loeb.find(params[:id]) if params.has_key? :id 
          rescue 
              render 'public/404', :status => 404, :layout => false
              return
             end
    if params.has_key? 'custom_id'
        @loeb = Loeb.where(:custom_id => params['custom_id']).first 
        redirect_to loeb_path @loeb rescue redirect_to '/', :notice => "Løbet blev ikke fundet"
        return
    end
    if @loeb.nil?
        redirect_to '/'
    else
        session[:loebs_id] = @loeb.id
        do_layout = params.has_key? "print"
        answers = Answer.where(:loeb_id => @loeb.id)
        @table = {}
        answers.each do |a|
            if not a.team_id.nil?
                @table[a.team_id] = {} if @table[a.team_id].nil?
                @table[a.team_id][a.post_id] = a.no_of_answers
            end
        end
        respond_to do |format|
            format.html { render :html => @loeb, :layout => (not do_layout)}# show.html.erb
            format.csv  { export_to_csv answers, @loeb.name }
        end
    end
  end

  # GET /loebs/new
  # GET /loebs/new.xml
  def new
    @loeb = Loeb.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loeb }
    end
  end

  # GET /loebs/1/edit
  def edit
    @loeb = Loeb.find(params[:id])
    if session[:loebs_id].to_i != @loeb.id.to_i   
        session[:loebs_id] = nil    
        redirect_to '/', :notice => "Du har ikke adgang her."
        return
    end
  end

  # POST /loebs
  # POST /loebs.xml
  def create
    params[:loeb][:custom_id].gsub! ' ',''
    @loeb = Loeb.new(params[:loeb])

    respond_to do |format|
      if @loeb.save
        format.html { redirect_to(@loeb, :notice => 'Løbet er blevet oprettet.') }
        format.xml  { render :xml => @loeb, :status => :created, :location => @loeb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loeb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loebs/1
  # PUT /loebs/1.xml
  def update
      params[:loeb][:custom_id].gsub! ' ',''
    @loeb = Loeb.find(params[:id])

    respond_to do |format|
      if @loeb.update_attributes(params[:loeb])
        format.html { redirect_to(@loeb, :notice => 'Løbet er blevet opdateret.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loeb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loebs/1
  # DELETE /loebs/1.xml
  def destroy
    @loeb = Loeb.find(params[:id])
    @loeb.destroy

    respond_to do |format|
      format.html { redirect_to(loebs_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
    def export_to_csv(data, name)
        csv_string = CSV.generate do |csv|
            csv << ["post_id", "hold_navn", "no_of_answers","answers", "foerste_svar", "seneste_svar"]
            data.each do |d|
                t = Team.find(d.team_id) rescue Team.new
                p = Post.find(d.post_id) rescue Post.new
                csv << [p.id.to_s+' - '+p.name, t.name, d.no_of_answers, d.answers, d.created_at, d.updated_at]
            end
        end
        send_data csv_string, :filename => name+'.csv'
    end
  
end
