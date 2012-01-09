class AccomodationsController < ApplicationController
  # GET /accomodations
  # GET /accomodations.json
  def index
    @accomodations = Accomodation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @accomodations }
    end
  end

  # GET /accomodations/1
  # GET /accomodations/1.json
  def show
    @accomodation = Accomodation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @accomodation }
    end
  end

  # GET /accomodations/new
  # GET /accomodations/new.json
  def new
    @accomodation = Accomodation.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @accomodation }
    end
  end

  # GET /accomodations/1/edit
  def edit
    @accomodation = Accomodation.find(params[:id])
  end

  # POST /accomodations
  # POST /accomodations.json
  def create
    @accomodation = Accomodation.new(params[:trip])

    respond_to do |format|
      if @accomodation.save
        format.html { redirect_to @accomodation, :notice => 'Accomodation was successfully created.' }
        format.json { render :json => @accomodation, :status => :created, :location => @accomodation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @accomodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accomodations/1
  # PUT /accomodations/1.json
  def update
    @accomodation = Accomodation.find(params[:id])

    respond_to do |format|
      if @accomodation.update_attributes(params[:accomodation])
        format.html { redirect_to @accomodation, :notice => 'Accomodation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @accomodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accomodations/1
  # DELETE /accomodations/1.json
  def destroy
    @accomodation = Accomodation.find(params[:id])
    @accomodation.destroy

    respond_to do |format|
      format.html { redirect_to accomodations_url }
      format.json { head :ok }
    end
  end
end
