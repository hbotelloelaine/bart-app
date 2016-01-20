
class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]


  def index
    @events = Event.all
    @events_coordinates = []
    @events.each_with_index do |event,index|
      coordinates = [event.latitude.to_s, event.longitude.to_s, event.name, event.place, event.url]
      coordinates =
      @events_coordinates << coordinates
    end
    @stations = Station.all
    @stations_map = []
    @stations.each do |station|
      coordinates = [station.latitude.to_s,station.longitude.to_s, station.name]
      @stations_map << coordinates 
    end
  end

  #   @stations = []
  #   stations.each do |station|
  #     coordinates = [station.latitude.to_s,station.longitude.to_s]
  #     @stations << coordinates
  #   end
# end

def show
@event = Event.find_by(id: params[:id])
@event_links = @event.links
@events =[Event.find_by(id: params[:id])]
    @events_coordinates = []
    @events.each_with_index do |event,index|
      coordinates = [event.latitude.to_s, event.longitude.to_s]
      coordinates =
      @events_coordinates << coordinates
    end
    @stations = Station.all
    @stations_map = []
    @stations.each do |station|
      coordinates = [station.latitude.to_s,station.longitude.to_s, station.name]
      @stations_map << coordinates 
    end
  # if params[:id] == "random"
  #       @event = Event.all.sample
  #     else 
  #   end
  end


def new
  @event = Event.new
end

def create
  
  @event = Event.new(event_params)
    if @event.place != '' || @event.place != nil
    
      coordinates = Geocoder.coordinates(params[:event][:place])
      if coordinates == nil

      else
        @event.latitude = coordinates[0]
        @event.longitude = coordinates[1]
      end
    end
    if @event.save
      
      print "This is an new id: #{@event.id}"
      Link.create(url: params["url"], event_id: @event.id)
      flash[:success] = "Event Added"
      redirect_to "/events/#{@event.id}"
    else
      render :new
    end

end

def edit
 @event = Event.find_by(id: params[:id])

end

def update
  @event = Event.find_by(id: params[:id])
  @event.update(event_params)
  flash[:success] = "Event Updated"
  redirect_to "/events/#{@event.id}"
end

def destroy 
  @event = Event.find(params[:id])
  @event.destroy
  redirect_to events_path, notice: "Event Deleted"

end
def search
      search_term = params[:search]
      @stations = Station.where("name LIKE ?", "%#{search_term}%" )
      @events = Event.where("name LIKE ?", "%#{search_term}%" )
      render :index
    end

private
def event_params
  params.require(:event).permit(:id, :name, :place, :start_at, :end_at, :station_id, :url)
end

end
