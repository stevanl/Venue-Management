class ApiController < ApplicationController  

  def search_venues
    @search = Venue.search(params[:search], :limit => 20)
    @venues = @search.page(params[:page]).per(20)
    
    respond_to do |format|
      format.xml
      format.json { render :partial => "api/search_venues.json", :content_type => :json }
    end
  end
  
  def show_venue
    @venue = Venue.find(params[:id])
    
    respond_to do |format|
      format.xml
      format.json { render :partial => "api/show_venue.json", :content_type => :json }
    end
  end

end