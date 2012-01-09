class ExtrasController < ApplicationController
  # GET /extras
  # GET /extras.json
  def index
    @extras = Extra.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @extras }
    end
  end

  # GET /extras/1
  # GET /extras/1.json
  def show
    @extra = Extra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @extra }
    end
  end

  # GET /extras/new
  # GET /extras/new.json
  def new
    @extra = Extra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @extra }
    end
  end

  # GET /extras/1/edit
  def edit
    @extra = Extra.find(params[:id])
  end

  # POST /extras
  # POST /extras.json
  def create
    @extra = Extra.new(params[:extra])

    respond_to do |format|
      if @extra.save
        format.html { redirect_to @extra, :notice => 'Extra was successfully created.' }
        format.json { render :json => @extra, :status => :created, :location => @extra }
      else
        format.html { render :action => "new" }
        format.json { render :json => @extra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /extras/1
  # PUT /extras/1.json
  def update
    @extra = Extra.find(params[:id])

    respond_to do |format|
      if @extra.update_attributes(params[:extra])
        format.html { redirect_to @extra, :notice => 'Extra was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @extra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /extras/1
  # DELETE /extras/1.json
  def destroy
    @extra = Extra.find(params[:id])
    @extra.destroy

    respond_to do |format|
      format.html { redirect_to extras_url }
      format.json { head :ok }
    end
  end
end
