require 'rails_helper'

RSpec.describe Location do
  describe '.from_json' do
    it 'creates a new Location instance from a JSON hash' do
      json = {
        results: [
          {
            locations: [
              {
                latLng: { lat: 40.7128, lng: -74.006 }
              }
            ]
          }
        ]
      }

      location = Location.from_json(json)

      expect(location.lat).to eq(40.7128)
      expect(location.lng).to eq(-74.006)
    end
  end
end
