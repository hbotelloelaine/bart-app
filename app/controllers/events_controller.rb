class EventsController < ApplicationController


  def index
    @events = Event.all
    @stations = Station.all
    @stations_map = []
    @stations.each do |station|
      coordinates = [station.latitude.to_s,station.longitude.to_s]
      @stations_map << coordinates
    end

  #   @stations = []
  #   stations.each do |station|
  #     coordinates = [station.latitude.to_s,station.longitude.to_s]
  #     @stations << coordinates
  #   end
end

def show
  @event = Event.find_by(id: params[:id])

end

def new
  @event = Event.new
end

def create
  @event = Event.new(event_params)
  coordinates = Geocoder.coordinates(event.place)
  @event.latitude = coordinates[0]
  @event.longitude = coordinates[1]
  if @event.save
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
      redirect_to "/events/#{event.id}"
end

def destroy 
  @event = Event.find(params[:id])
  @event.destroy
  redirect_to events_path, notice: "Event Deleted"

end
private
def event_params
    params.require(:event).permit(:id, :name, :place, :start_at, :end_at, :station_id)
  end

end
