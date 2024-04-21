require 'rails_helper'

RSpec.describe Weather do
  describe '.from_json' do
    it 'creates a new Weather instance from a JSON hash' do
      current_json = { last_updated: '2024-04-20', temperature: 75, feelslike_f: 70, humidity: 50, condition: { text: 'Sunny', icon: 'sun.png' }, uv: 5, vis_miles: 10 }
      forecastday_json = [
        { date: '2024-04-21',
          day: { maxtemp_f: 80, mintemp_f: 60, condition: { text: 'Sunny', icon: 'sun.png' } },
          astro: { sunrise: '6:00 AM', sunset: '6:00 PM' },
          hour: [
            { time: '12:00 PM', temp_f: 70, condition: { text: 'Sunny', icon: 'sun.png' } },
            { time: '1:00 PM', temp_f: 71, condition: { text: 'Sunny', icon: 'sun.png' } }
          ] },
        { date: '2024-04-22',
          day: { maxtemp_f: 85, mintemp_f: 65, condition: { text: 'Sunny', icon: 'sun.png' } },
          astro: { sunrise: '6:01 AM', sunset: '6:01 PM' },
          hour: [
            { time: '1:00 PM', temp_f: 75, condition: { text: 'Cloudy', icon: 'cloud.png' } },
            { time: '2:00 PM', temp_f: 74, condition: { text: 'Rainy', icon: 'rainy.png' } }
          ] }
      ]
      json = { current: current_json, forecast: { forecastday: forecastday_json } }

      weather = Weather.from_json(json)

      expect(weather.forecastday[0].day.maxtemp_f).to eq(80)
      expect(weather.forecastday[0].day.mintemp_f).to eq(60)
      expect(weather.forecastday[0].day.condition).to eq('Sunny')
      expect(weather.forecastday[0].day.icon).to eq('sun.png')

      expect(weather.forecastday[0].astro.sunrise).to eq('6:00 AM')
      expect(weather.forecastday[0].astro.sunset).to eq('6:00 PM')

      expect(weather.forecastday[0].hour.length).to eq(2)
      expect(weather.forecastday[0].hour[0].time).to eq('12:00 PM')
      expect(weather.forecastday[0].hour[0].temp_f).to eq(70)
      expect(weather.forecastday[0].hour[0].condition).to eq('Sunny')
      expect(weather.forecastday[0].hour[0].icon).to eq('sun.png')
      expect(weather.forecastday[0].hour[1].time).to eq('1:00 PM')
      expect(weather.forecastday[0].hour[1].temp_f).to eq(71)
      expect(weather.forecastday[0].hour[1].condition).to eq('Sunny')
      expect(weather.forecastday[0].hour[1].icon).to eq('sun.png')
    end
  end
end
