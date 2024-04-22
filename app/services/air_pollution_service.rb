class AirPollutionService
  def self.conn
    Faraday.new(url: "http://api.openweathermap.org/data/2.5")
  end

  def self.get_url(url, params)
    response = conn.get(url, { appid: Rails.application.credentials[:air_pollution_api_key] }.merge(params))
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_current_aqi(lat, lon)
    response = get_url("air_pollution", { lat: lat, lon: lon })
      AirPollution.from_json(response)
  end
end
