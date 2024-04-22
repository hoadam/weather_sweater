class AirPollution
  attr_reader :datetime, :aqi

  def initialize(datetime, aqi)
    @datetime = datetime
    @aqi = aqi
  end

  def self.from_json(json)
    new(
      json[:list].first.dig(:dt),
      json[:list].first.dig(:main, :aqi)
    )
  end
end
