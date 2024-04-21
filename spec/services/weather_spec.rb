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
end
