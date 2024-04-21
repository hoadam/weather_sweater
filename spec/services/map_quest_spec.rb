require 'rails_helper'

RSpec.describe MapQuestService do
  describe '.get_latlng' do
    it "returns the latitude and longtitude of a location", :vcr do
      location = 'San Francisco, CA'
      result = MapQuestService.get_latlng(location)

      expect(result).to be_a(Location)
      expect(result.lat).to eq(37.77712)
      expect(result.lng).to eq(-122.41966)
    end
  end
end
