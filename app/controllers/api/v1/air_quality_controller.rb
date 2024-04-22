class Api::V1::AirQualityController < ApplicationController
  def index
    location = MapQuestService.get_latlng(params[:location])
    lat = location.lat
    lon = location.lng
    air_quality_data = AirPollutionService.get_current_aqi(lat, lon)
    render json: AirPollutionSerializer.format_data(air_quality_data)
  end
end
