require 'rails_helper'

RSpec.describe Weather::Hour do
  describe '.from_json' do
    it 'creates a new Hour instance from a JSON hash' do
      json = {
        time: '12:00 PM',
        temp_f: 70,
        condition: { text: 'Sunny', icon: 'sun.png' }
      }
      hour = Weather::Hour.from_json(json)

      expect(hour.time).to eq(json[:time])
      expect(hour.temp_f).to eq(json[:temp_f])
      expect(hour.condition).to eq(json.dig(:condition, :text))
      expect(hour.icon).to eq(json.dig(:condition, :icon))
    end
  end
end
