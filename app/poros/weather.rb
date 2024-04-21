class Weather
  attr_reader :current, :forecastday

  def initialize(current, forecastday)
    @current = current
    @forecastday = forecastday
  end

  def self.from_json(json)
    current = Weather::Current.from_json(json[:current])
    forecastday_json = json.dig(:forecast, :forecastday)

    forecast = forecastday_json.map do |forecast_day_hash|
      Weather::Forecast.new(
        forecast_day_hash[:date],
        Weather::Day.from_json(forecast_day_hash[:day]),
        Weather::Astro.from_json(forecast_day_hash[:astro]),
        forecast_day_hash[:hour].map { |hour_hash| Weather::Hour.from_json(hour_hash) })
    end

    new(
      current,
      forecast
    )
  end
end
