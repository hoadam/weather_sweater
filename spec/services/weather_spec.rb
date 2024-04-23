require 'rails_helper'

RSpec.describe WeatherService do
  describe '.get_weather' do
    it 'returns weather data for a given latitude and longitude', :vcr do
      lat = 37.7749
      lng = -122.4194

      weather = WeatherService.get_weather(lat, lng)

      expect(weather).to be_a(Weather)
      expect(weather.current.last_updated).to eq("2024-04-21 14:30")
    end
  end

  describe '.get_end_point_weather' do
    it "returns weather data for the end point of the trip", :vcr do
      location = "Oakland, CA"
      datetime = "2024-04-22"

      end_point_weather = WeatherService.get_end_point_weather(location, datetime)

      expect(end_point_weather).to be_a(Weather::Forecast)
      expect(end_point_weather.date).to eq(datetime)
    end
  end
end
