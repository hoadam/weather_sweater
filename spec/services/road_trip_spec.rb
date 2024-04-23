require 'rails_helper'

RSpec.describe RoadTripService do
  describe '.get_route' do
    it 'creates a new Route instance from the response', :vcr do
      start_point = "San Francisco, CA"
      end_point = "Oakland, CA"
      result = RoadTripService.get_route(start_point, end_point)

      expect(result).to be_a(Route)
      expect(result.travel_time).to eq(924)
    end
  end
end
