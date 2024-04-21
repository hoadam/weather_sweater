class Location
  attr_reader :lat, :lng

  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def self.from_json(json)
    new(
      json[:results].first.dig(:locations).first.dig(:latLng, :lat),
      json[:results].first.dig(:locations).first.dig(:latLng, :lng)
    )
  end
end
