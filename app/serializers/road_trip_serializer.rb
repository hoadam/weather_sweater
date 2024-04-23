class RoadTripSerializer
  include JSONAPI::Serializer
  attributes :start_city, :end_city, :travel_time, :weather_at_eta

  def self.format_data(route, forecast)
    date_time = Time.now + route.travel_time
    {
      data: {
        id: nil,
        type: "road_trip",
        attributes: {
          start_city: "#{route.start_city}, #{route.start_state}",
          end_city: "#{route.end_city}, #{route.end_state}",
          travel_time: ActiveSupport::Duration.build(route.travel_time).to_s,
          weather_at_eta: {
            datetime: Time.now + route.travel_time,
            temperature: weather_by_datetime(date_time, forecast).temp_f,
            condition: weather_by_datetime(date_time, forecast).condition
          }
        }
      }
    }
  end

  def self.weather_by_datetime(datetime, forecast)
    weather_at_hour = forecast.hour.find { |hr| hr.time = datetime }
  end
end
