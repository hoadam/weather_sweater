class Api::V0::ForecastController < ApplicationController
  def index
    location = MapQuestService.get_latlng(params[:location])
    lat = location.lat
    lng = location.lng
    weather_data = WeatherService.get_weather(lat, lng)
    render json: ForecastSerializer.format_data(weather_data)
  end
end
