class Weather::Hour
  attr_reader :time,
              :temp_f,
              :condition,
              :icon

  def initialize(time, temp_f, condition, icon)
    @time = time
    @temp_f = temp_f
    @condition = condition
    @icon = icon
  end

  def self.from_json(json)
    new(
      json.dig(:time),
      json.dig(:temp_f),
      json.dig(:condition, :text),
      json.dig(:condition, :icon)
    )
  end
end
