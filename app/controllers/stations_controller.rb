class StationsController < ApplicationController
  def index
    @events = Event.all
    @events_coordinates = []
    @events.each_with_index do |event,index|
      coordinates = [event.latitude.to_s, event.longitude.to_s]
      coordinates =
      @events_coordinates << coordinates
    end
    @stations = Station.all
    @stations_map = []
    @stations.each do |station|
      coordinates = [station.latitude.to_s,station.longitude.to_s]
      @stations_map << coordinates
    end
  end

  def show
    @station = Station.find_by(id: params[:id])
    @stations = [Station.find_by(id: params[:id])]
    @stations_map = []
    @stations.each do |station|
      coordinates = [station.latitude.to_s,station.longitude.to_s, station.name]
      @stations_map << coordinates 
    end

    @events = Event.all
    @events_coordinates = []
    @events.each do |event|
      distance = Geocoder::Calculations.distance_between([@station.latitude, @station.longitude], [event.latitude, event.longitude])
      if distance <= 10
        coordinates = [event.latitude.to_s, event.longitude.to_s, event.name]
        @events_coordinates << coordinates
      end
    end

  end

  def new
    @event = Event.new(event_params)
    if @event.place != '' || @event.place != nil
      
      coordinates = Geocoder.coordinates(params[:event][:place])
      if coordinates == nil

      else
        @event.latitude = coordinates[0]
        @event.longitude = coordinates[1]
      end
    end
  end
end
