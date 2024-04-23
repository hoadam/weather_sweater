class WeatherService
  def self.conn
    Faraday.new(url: "http://api.weatherapi.com/v1")
  end

  def self.get_url(url, params)
    response = conn.get(url, { key: Rails.application.credentials[:weather_api_key] }.merge(params) )
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_weather(lat, lng)
    response = get_url("forecast.json", q: "#{lat},#{lng}", days: 5)
      Weather.from_json(response)
  end

  def self.get_end_point_weather(location, datetime)
    response = get_url("future.json", q: "#{location}", dt: "#{datetime}")
      Weather::Forecast.from_json(response)
  end
end
