require 'rails_helper'

RSpec.describe AirPollutionService do
  describe '.get_current_aqi' do
    it 'returns air pollution data for a given latitude and longitude', :vcr do
      lat = 37.7749
      lon = -122.4194

      air_pollution = AirPollutionService.get_current_aqi(lat, lon)

      expect(air_pollution).to be_a(AirPollution)
      expect(air_pollution.datetime).to eq(1713803302)
      expect(air_pollution.aqi).to eq(2)
    end
  end
end
