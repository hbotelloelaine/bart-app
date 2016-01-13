class StationsController < ApplicationController
  def index
    @stations = Station.all
    @stations_map = []
    @stations.each do |station|
      coordinates = [station.latitude.to_s,station.longitude.to_s]
      @stations_map << coordinates
    end
  end

  def show
    @station = Station.find_by(id: params[:id])
  end
end
