class NearbyFacilitiesController < ApplicationController
  # GET /nearby_facilities
  # GET /nearby_facilities.xml
  def index
    @venue = Venue.find(params[:venue_id])
    @nearby_facilities = @venue.nearby_facility

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @nearby_facilities }
    end
  end
  
  # GET /nearby_facilities/1
  # GET /nearby_facilities/1.xml
  def show
    @venue = Venue.find(params[:venue_id])
    @nearby_facility = @venue.nearby_facility.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nearby_facility }
    end
  end

  # GET /nearby_facilities/new
  # GET /nearby_facilities/new.xml
  def new
    @venue = Venue.find(params[:venue_id])
    @nearby_facility = @venue.nearby_facility.new

    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
   # GET /nearby_facilities/1/edit
  def edit
    @venue = Venue.find(params[:venue_id])
    @nearby_facility = @venue.nearby_facility.find(params[:id])
  end
  
  # POST /nearby_facilities
  # POST /nearby_facilities.xml
  def create
    @venue = Venue.find(params[:venue_id])
    @nearby_facility = @venue.nearby_facility.new(params[:nearby_facility])
    
    respond_to do |format|
      if @nearby_facility.save
        format.html { redirect_to(venue_nearby_facilities_path, :notice => 'nearby_facility was successfully created.') }
      else
        format.html {render :action => "new" }
      end 
    end
  end
  
  # POST /nearby_facilities
  # POST /nearby_facilities.xml
  def update
    @venue = Venue.find(params[:venue_id])
    @nearby_facility = @venue.nearby_facility.find(params[:id])
        
    respond_to do |format|
      if @nearby_facility.update_attributes(params[:nearby_facility])
        #format.html { redirect_to(venue_nearby_facilities_path, :notice => "nearby_facility was successfully updated.")}
        format.html { redirect_to(venue_nearby_facilities_path, :notice => "nearby_facility was successfully updated.")}
        format.xml { head :ok }
       else
         format.html { render :action => "edit"}
         format.xml { render :xml => @nearby_facility.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #DELETE /nearby_facilities/1
  #DELETE /nearby_facilities/1.xml
  def destroy
    @venue = Venue.find(params[:venue_id])
    @nearby_facility = @venue.nearby_facility.find(params[:id])
    @nearby_facility.destroy
    
    respond_to do |format|
      format.html { redirect_to(venue_nearby_facilities_url)}
      format.xml { head :ok } 
    end
  end
end
