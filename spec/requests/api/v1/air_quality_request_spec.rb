require 'rails_helper'

RSpec.describe "Air Quality API" do
  describe "happy path" do
    it "returns JSON data of current air quality at the provided location", :vcr do
      location = "India"
      get "/api/v1/air_quality", params: {location: location}

      expect(response). to be_successful
      json = JSON.parse(response.body)
      expect(json). to match(
        {
          "data" => {
            "id" => nil,
            "type" => "air_quality",
            "attributes" => {
              "aqi" => 4,
              "datetime" => 1713803923,
              "readable_aqi" => "Poor"
            }
          }
        }
      )
    end
  end
end
