class StylesController < ApplicationController
  # GET /styles
  # GET /styles.xml
  def index
    @venue = Venue.find(params[:venue_id])
    @styles = @venue.style
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @styles }
    end
  end
  
  # GET /styles/1
  # GET /styles/1.xml
  def show
    @venue = Venue.find(params[:venue_id])
    @style = @venue.style.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @style }
    end
  end

  # GET /styles/new
  # GET /styles/new.xml
  def new
    @venue = Venue.find(params[:venue_id])
    @style = @venue.style.new

    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
   # GET /styles/1/edit
  def edit
    @venue = Venue.find(params[:venue_id])
    @style = @venue.style.find(params[:id])
  end
  
  # POST /styles
  # POST /styles.xml
  def create
    @venue = Venue.find(params[:venue_id])
    @style = @venue.style.new(params[:style])
    
    respond_to do |format|
      if @style.save
        format.html { redirect_to(venue_styles_path, :notice => 'style was successfully created.') }
      else
        format.html {render :action => "new" }
      end 
    end
  end
  
  # POST /styles
  # POST /styles.xml
  def update
    @venue = Venue.find(params[:venue_id])
    @style = @venue.style.find(params[:id])
        
    respond_to do |format|
      if @style.update_attributes(params[:style])
        #format.html { redirect_to(venue_styles_path, :notice => "style was successfully updated.")}
        format.html { redirect_to(venue_styles_path, :notice => "style was successfully updated.")}
        format.xml { head :ok }
       else
         format.html { render :action => "edit"}
         format.xml { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #DELETE /styles/1
  #DELETE /styles/1.xml
  def destroy
    @venue = Venue.find(params[:venue_id])
    @style = @venue.style.find(params[:id])
    @style.destroy
    
    respond_to do |format|
      format.html { redirect_to(venue_styles_url)}
      format.xml { head :ok } 
    end
  end
end
