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
    @loeb = Loeb.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loeb }
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
    @loeb = Loeb.new(params[:loeb])

    respond_to do |format|
      if @loeb.save
        format.html { redirect_to(@loeb, :notice => 'Loeb was successfully created.') }
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
    @loeb = Loeb.find(params[:id])

    respond_to do |format|
      if @loeb.update_attributes(params[:loeb])
        format.html { redirect_to(@loeb, :notice => 'Loeb was successfully updated.') }
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
