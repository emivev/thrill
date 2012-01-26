class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json  
  def index   
    @search = Trip.search(params[:search])  
    
    @trips = @search.paginate(:page => params[:page], :per_page => 7)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @meta_title = " Thrill Engine | #{@trip.categories.map(&:name).to_sentence} | #{@trip.title} - "
    @meta_description = @trip.description
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  
  def new
    @trip = Trip.new
    5.times { @trip.images.build }
    3.times { @trip.accomodations.build }
    3.times { @trip.lessons.build }  
    3.times { @trip.reviews.build } 
  
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    5.times { @trip.images.build }
    3.times { @trip.accomodations.build }
    3.times { @trip.lessons.build }
    3.times { @trip.reviews.build } 
  end



  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, :notice => 'Trip was successfully created.' }
        format.json { render :json => @trip, :status => :created, :location => @trip }
      else
        format.html { render :action => "new" }
        format.json { render :json => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])
   
    
    params[:trip][:category_ids] ||= []
     params[:trip][:type_ids] ||= []
    
    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, :notice => 'Trip was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :ok }
    end
  end
end
