class RoadTripService
  def self.conn
    conn = Faraday.new(url: "https://www.mapquestapi.com/directions/v2")
  end

  def self.get_url(url, params)
    response = conn.get(url, { key: Rails.application.credentials[:map_quest_api_key] }.merge(params) )
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(start_point, end_point)
    response = get_url("routematrix", { locations: [ start_point, end_point] })
      Route.from_json(response)
  end
end
