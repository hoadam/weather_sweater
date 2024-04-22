class AirPollutionSerializer
  include JSONAPI::Serializer

  attributes :aqi, :datetime, :readable_aqi


  def self.format_data(air_pollution)
    readable_aqi = case air_pollution.aqi
                    when 1
                      "Good"
                    when 2
                      "Fair"
                    when 3
                      "Moderate"
                    when 4
                      "Poor"
                    when 5
                      "Very Poor"
                    end

    {
      data: {
        id: nil,
        type: "air_quality",
        attributes: {
          aqi: air_pollution.aqi,
          datetime: air_pollution.datetime,
          readable_aqi: readable_aqi
        }
      }
    }
  end
end
