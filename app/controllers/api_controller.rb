class ApiController < ApplicationController  

  def search_venues
    @venues = Venue.all
    
    respond_to do |format|
      format.xml
      format.json { render :partial => "api/search_venues.json", :content_type => :json }
    end
  end

end