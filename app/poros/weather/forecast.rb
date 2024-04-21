class Weather::Forecast
  attr_reader :date, :day, :astro, :hour

  def initialize(date, day, astro, hour)
    @date = date
    @day = day
    @astro = astro
    @hour = hour
  end

  def self.from_json(json)
    date = json[:date]
    day = Weather::Day.from_json(json[:day])
    astro = Weather::Astro.from_json(json[:astro])
    hour = json[:hour]

    hour_poro_array = hour.map do |raw|
      Weather::Hour.from_json(raw)
    end

    new(
      date, day, astro, hour_poro_array
    )
  end
end
