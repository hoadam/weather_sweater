class Route
  attr_reader :start_city,
              :start_state,
              :end_city,
              :end_state,
              :travel_time

  def initialize(start_city, start_state, end_city, end_state, travel_time)
    @start_city = start_city
    @start_state = start_state
    @end_city = end_city
    @end_state = end_state
    @travel_time = travel_time
  end

  def self.format_data(json)
    new(
      json.dig(:location).first.dig(:adminArea5),
      json.dig(:location).first.dig(:adminArea3),
      json.dig(:location).last.dig(:adminArea5),
      json.dig(:location).last.dig(:adminArea3),
      json.dig(:time).last
    )
  end
end
