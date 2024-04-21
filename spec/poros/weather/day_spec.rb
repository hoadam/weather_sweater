require 'rails_helper'

RSpec.describe Weather::Day do
  describe '.from_json' do
    it 'creates a new Weather::Day instance from a JSON hash' do
      json = { maxtemp_f: 75, mintemp_f: 55, condition: { text: 'Sunny', icon: 'sun.png' } }
      day = Weather::Day.from_json(json)

      expect(day.maxtemp_f).to eq(json[:maxtemp_f])
      expect(day.mintemp_f).to eq(json[:mintemp_f])
      expect(day.condition).to eq(json.dig(:condition, :text))
      expect(day.icon).to eq(json.dig(:condition, :icon))
    end
  end
end
