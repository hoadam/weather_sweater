class ForecastSerializer
  include JSONAPI::Serializer
  attributes :current_weather, :daily_weather, :hourly_wearther
  def self.format_data(weather)
    current_day = weather.forecastday.first
    {
      data: {
        id: nil,
        attributes: {
          current_weather: {
            last_updated: weather.current.last_updated,
            temperature: weather.current.temperature,
            feelslike: weather.current.feelslike_f,
            humidity: weather.current.humidity,
            condition: weather.current.condition,
            condition_icon: weather.current.current_icon
          },
          daily_weather: weather.forecastday.map do |day|
            {
              date: day.date,
              sunrise: day.astro.sunrise,
              sunset: day.astro.sunset,
              max_temp: day.day.maxtemp_f,
              mintemp_f: day.day.mintemp_f,
              condition: day.day.condition,
              condition_icon: day.day.icon
            }
          end,

          hourly_weather: current_day.hour.map do |hour|
            {
              time: hour.time,
              temperature: hour.temp_f,
              condition: hour.condition,
              icon: hour.icon
            }
          end
        }
      }
    }
  end
end
