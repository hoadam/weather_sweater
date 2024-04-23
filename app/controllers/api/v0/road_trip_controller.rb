class Api::V0::RoadTripController < ApplicationController
  def create
    route = RoadTripService.get_route(params[:origin], params[:destination])
    time_at_destination = (Time.now + route.travel_time).strftime('%Y-%m-%d')
    end_point_weather = WeatherService.get_end_point_weather(params[:destination], time_at_destination)
    render json: RoadTripSerializer.format_data(end_point_weather)
  end
end
