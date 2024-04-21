require 'rails_helper'

RSpec.describe Weather::Current do
  describe '.from_json' do
    it 'creates a new Weather::Current instance from a JSON hash' do
      json = {
        last_updated: Time.now.to_s,
        temp_f: 75,
        feelslike_f: 72,
        humidity: 50,
        condition: { text: 'Sunny', icon: 'sun.png' },
        uv: 5,
        vis_miles: 10
      }
      current_weather = Weather::Current.from_json(json)

      expect(current_weather.last_updated.to_s).to eq(json[:last_updated])
      expect(current_weather.temperature).to eq(json[:temp_f])
      expect(current_weather.feelslike_f).to eq(json[:feelslike_f])
      expect(current_weather.humidity).to eq(json[:humidity])
      expect(current_weather.condition).to eq(json.dig(:condition, :text))
      expect(current_weather.current_icon).to eq(json.dig(:condition, :icon))
      expect(current_weather.uv).to eq(json[:uv])
      expect(current_weather.vis_miles).to eq(json[:vis_miles])
    end
  end
end
