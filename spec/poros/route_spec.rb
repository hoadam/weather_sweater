RSpec.describe Route do
  describe '.format_data' do
    let(:json) do
      {
        time: [0, 924]
      }
    end

    it 'creates a new Route instance from JSON data' do
      route = Route.from_json(json)
      # expect(route.start_city).to eq('San Francisco')
      # expect(route.start_state).to eq('CA')
      # expect(route.end_city).to eq('Oakland')
      # expect(route.end_state).to eq('CA')
      expect(route.travel_time).to eq(924)
    end
  end
end
