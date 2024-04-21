class Weather::Astro
  attr_reader :sunrise,
              :sunset

  def initialize(sunrise, sunset)
    @sunrise = sunrise
    @sunset = sunset
  end

  def self.from_json(json)
    new(
      json.dig(:sunrise),
      json.dig(:sunset)
    )
  end
end
