class Weather::Day
  attr_reader :maxtemp_f,
              :mintemp_f,
              :condition,
              :icon

  def initialize(maxtemp_f, mintemp_f, condition, icon)
    @maxtemp_f = maxtemp_f
    @mintemp_f = mintemp_f
    @condition = condition
    @icon = icon
  end

  def self.from_json(json)
    new(
      json.dig(:maxtemp_f),
      json.dig(:mintemp_f),
      json.dig(:condition, :text),
      json.dig(:condition, :icon)
    )
  end
end
