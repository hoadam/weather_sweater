require 'rails_helper'

RSpec.describe AirPollution do
  describe '.from_json' do
    let(:json) do
      {
        list: [
          {
            dt: 1605182400,
            main: {
              aqi: 1
            }
          }
        ]
      }
    end

    it 'creates a new AirPollution instance from a JSON hash' do
      air_pollution = AirPollution.from_json(json)
      expect(air_pollution.datetime).to eq(1605182400)
      expect(air_pollution.aqi).to eq(1)
    end
  end
end
