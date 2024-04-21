class MapQuestService
  def self.conn
    conn = Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1")
  end

  def self.get_url(url, params)
    response = conn.get(url, { key: Rails.application.credentials[:map_quest_api_key] }.merge(params) )
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_latlng(location)
    response = get_url("address", location: location)
      Location.from_json(response)
  end
end
