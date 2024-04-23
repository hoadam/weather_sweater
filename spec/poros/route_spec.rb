RSpec.describe Route do
  describe '.format_data' do
    let(:json) do
      {
        location: [
          { adminArea5: 'San Francisco', adminArea3: 'CA' },
          { adminArea5: 'Oakland', adminArea3: 'CA' }
        ],
        time: [0, 924]
      }
    end

    it 'creates a new Route instance from JSON data' do
      route = Route.format_data(json)
      expect(route.start_city).to eq('San Francisco')
      expect(route.start_state).to eq('CA')
      expect(route.end_city).to eq('Oakland')
      expect(route.end_state).to eq('CA')
      expect(route.travel_time).to eq(924)
    end
  end
end
