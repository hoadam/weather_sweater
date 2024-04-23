class Route
  attr_reader :travel_time

  def initialize(travel_time)
    @travel_time = travel_time
  end

  def self.from_json(json)
    new(
      json.dig(:time).last
    )
  end
end
