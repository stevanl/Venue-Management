class AttractionsController < ApplicationController
  # GET /attractions
  # GET /attractions.xml
  def index
    @venue = Venue.find(params[:venue_id])
    @attractions = @venue.attraction
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @attractions }
    end
  end
  
  # GET /attractions/1
  # GET /attractions/1.xml
  def show
    @venue = Venue.find(params[:venue_id])
    @attraction = @venue.attraction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attraction }
    end
  end

  # GET /attractions/new
  # GET /attractions/new.xml
  def new
    @venue = Venue.find(params[:venue_id])
    @attraction = @venue.attraction.new

    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
   # GET /attractions/1/edit
  def edit
    @venue = Venue.find(params[:venue_id])
    @attraction = @venue.attraction.find(params[:id])
  end
  
  # POST /attractions
  # POST /attractions.xml
  def create
    @venue = Venue.find(params[:venue_id])
    @attraction = @venue.attraction.new(params[:attraction])
    
    respond_to do |format|
      if @attraction.save
        format.html { redirect_to(venue_attractions_path, :notice => 'attraction was successfully created.') }
      else
        format.html {render :action => "new" }
      end 
    end
  end
  
  # POST /attractions
  # POST /attractions.xml
  def update
    @venue = Venue.find(params[:venue_id])
    @attraction = @venue.attraction.find(params[:id])
        
    respond_to do |format|
      if @attraction.update_attributes(params[:attraction])
        #format.html { redirect_to(venue_attractions_path, :notice => "attraction was successfully updated.")}
        format.html { redirect_to(venue_attractions_path, :notice => "attraction was successfully updated.")}
        format.xml { head :ok }
       else
         format.html { render :action => "edit"}
         format.xml { render :xml => @attraction.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #DELETE /attractions/1
  #DELETE /attractions/1.xml
  def destroy
    @venue = Venue.find(params[:venue_id])
    @attraction = @venue.attraction.find(params[:id])
    @attraction.destroy
    
    respond_to do |format|
      format.html { redirect_to(venue_attractions_url)}
      format.xml { head :ok } 
    end
  end
end
