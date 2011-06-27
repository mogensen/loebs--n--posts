#encoding: utf-8

class LoebsController < ApplicationController
  # GET /loebs
  # GET /loebs.xml
  def index
    @loebs = Loeb.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loebs }
    end
  end

  # GET /loebs/1
  # GET /loebs/1.xml
  def show
    @loeb = Loeb.find(params[:id]) if params.has_key? :id
    @loeb = Loeb.where(:custom_id => params['custom_id']).first if params.has_key? 'custom_id'
    
    if @loeb.nil?
        redirect_to '/'
    else
        do_layout = params.has_key? "print"
    
        respond_to do |format|
            format.html { render :html => @loeb, :layout => (not do_layout)}# show.html.erb
            format.xml  { render :xml => @loeb }
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
end
