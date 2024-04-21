class Weather::Current
  attr_reader :last_updated,
              :temperature,
              :feelslike_f,
              :humidity,
              :condition,
              :current_icon,
              :uv,
              :vis_miles

  def initialize(last_updated, temperature, feelslike_f, humidity, condition, current_icon, uv, vis_miles)
    @last_updated = last_updated
    @temperature = temperature
    @feelslike_f = feelslike_f
    @humidity = humidity
    @condition = condition
    @current_icon = current_icon
    @uv = uv
    @vis_miles = vis_miles
  end

  def self.from_json(json)
    new(
      json.dig(:last_updated),
      json.dig(:temp_f),
      json.dig(:feelslike_f),
      json.dig(:humidity),
      json.dig(:condition, :text),
      json.dig(:condition, :icon),
      json.dig(:uv),
      json.dig(:vis_miles)
    )
  end
end
