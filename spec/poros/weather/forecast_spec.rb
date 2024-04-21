require 'rails_helper'

RSpec.describe Weather::Forecast do
  describe '.from_json' do
    it 'creates a new Weather::Forecast instance from a JSON hash' do
      json = {
        date: '2024-04-21',
        day: { maxtemp_f: 80, mintemp_f: 60, condition: { text: 'Sunny', icon: 'sun.png' } },
        astro: { sunrise: '6:00 AM', sunset: '6:00 PM' },
        hour: [{ time: '12:00 PM', temp_f: 70, condition: { text: 'Sunny', icon: 'sun.png' }},
               { time: '13:00 PM', temp_f: 71, condition: { text: 'Sunny', icon: 'sun.png' }}]
      }

      forecast = Weather::Forecast.from_json(json)

      expect(forecast.date).to eq('2024-04-21')
      expect(forecast.day.maxtemp_f).to eq(80)
      expect(forecast.day.mintemp_f).to eq(60)
      expect(forecast.day.condition).to eq('Sunny')
      expect(forecast.day.icon).to eq('sun.png')
      expect(forecast.astro.sunrise).to eq('6:00 AM')
      expect(forecast.astro.sunset).to eq('6:00 PM')
      expect(forecast.hour.length).to eq(2)
      expect(forecast.hour.first.time).to eq('12:00 PM')
      expect(forecast.hour.first.temp_f).to eq(70)
      expect(forecast.hour.first.condition).to eq('Sunny')
      expect(forecast.hour.first.icon).to eq('sun.png')
      expect(forecast.hour.last.time).to eq('13:00 PM')
      expect(forecast.hour.last.temp_f).to eq(71)
      expect(forecast.hour.last.condition).to eq('Sunny')
      expect(forecast.hour.last.icon).to eq('sun.png')
    end
  end
end
