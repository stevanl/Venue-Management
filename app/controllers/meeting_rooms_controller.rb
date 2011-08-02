class MeetingRoomsController < ApplicationController
  # GET /meeting_rooms
  # GET /meeting_rooms.xml
  def index
    @venue = Venue.find(params[:venue_id])
    @meeting_rooms = @venue.meeting_room

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @meeting_rooms }
    end
  end
  
  # GET /meeting_rooms/1
  # GET /meeting_rooms/1.xml
  def show
    @venue = Venue.find(params[:venue_id])
    @meeting_room = @venue.meeting_room.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meeting_room }
    end
  end

  # GET /meeting_rooms/new
  # GET /meeting_rooms/new.xml
  def new
    @venue = Venue.find(params[:venue_id])
    @meeting_room = @venue.meeting_room.new

    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
   # GET /meeting_rooms/1/edit
  def edit
    @venue = Venue.find(params[:venue_id])
    @meeting_room = @venue.meeting_room.find(params[:id])
  end
  
  # POST /meeting_rooms
  # POST /meeting_rooms.xml
  def create
    @venue = Venue.find(params[:venue_id])
    @meeting_room = @venue.meeting_room.new(params[:meeting_room])
    
    respond_to do |format|
      if @meeting_room.save
        format.html { redirect_to(venue_meeting_rooms_path, :notice => 'meeting_room was successfully created.') }
      else
        format.html {render :action => "new" }
      end 
    end
  end
  
  # POST /meeting_rooms
  # POST /meeting_rooms.xml
  def update
    @venue = Venue.find(params[:venue_id])
    @meeting_room = @venue.meeting_room.find(params[:id])
        
    respond_to do |format|
      if @meeting_room.update_attributes(params[:meeting_room])
        #format.html { redirect_to(venue_meeting_rooms_path, :notice => "meeting_room was successfully updated.")}
        format.html { redirect_to(venue_meeting_rooms_path, :notice => "meeting_room was successfully updated.")}
        format.xml { head :ok }
       else
         format.html { render :action => "edit"}
         format.xml { render :xml => @meeting_room.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #DELETE /meeting_rooms/1
  #DELETE /meeting_rooms/1.xml
  def destroy
    @venue = Venue.find(params[:venue_id])
    @meeting_room = @venue.meeting_room.find(params[:id])
    @meeting_room.destroy
    
    respond_to do |format|
      format.html { redirect_to(venue_meeting_rooms_url)}
      format.xml { head :ok } 
    end
  end
end
