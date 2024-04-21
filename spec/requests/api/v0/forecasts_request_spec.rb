require 'rails_helper'

RSpec.describe 'Forecasts API', :vcr do
  describe "happy path" do
    it "returns JSON data of weather in 5 days" do
      location = "San Francisco, CA"
      get "/api/v0/forecast", params: { location: location }

      expect(response).to be_successful
      json = JSON.parse(response.body)
      expect(json["data"]["attributes"]["current_weather"]).to match(
        "last_updated" => "2024-04-21 15:00",
        "temperature" => 71.1,
        "feelslike" => 71.1,
        "humidity" => 53,
        "condition" => "Partly cloudy",
        "condition_icon" => "//cdn.weatherapi.com/weather/64x64/day/116.png"
      )
      expect(json["data"]["attributes"]["daily_weather"]).to contain_exactly(
        {
        "date" => "2024-04-21",
        "sunrise" => "06:25 AM",
        "sunset" => "07:52 PM",
        "max_temp" => 66.2,
        "mintemp_f" => 53.2,
        "condition" => "Sunny",
        "condition_icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "date" => "2024-04-22",
        "sunrise" => "06:24 AM",
        "sunset" => "07:53 PM",
        "max_temp" => 63.4,
        "mintemp_f" => 53.4,
        "condition" => "Sunny",
        "condition_icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "date" => "2024-04-23",
        "sunrise" => "06:23 AM",
        "sunset" => "07:54 PM",
        "max_temp" => 59.5,
        "mintemp_f" => 52.5,
        "condition" => "Patchy rain nearby",
        "condition_icon" => "//cdn.weatherapi.com/weather/64x64/day/176.png"
        },
        {
        "date" => "2024-04-24",
        "sunrise" => "06:21 AM",
        "sunset" => "07:54 PM",
        "max_temp" => 59.3,
        "mintemp_f" => 51.7,
        "condition" => "Partly Cloudy ",
        "condition_icon" => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        },
        {
        "date" => "2024-04-25",
        "sunrise" => "06:20 AM",
        "sunset" => "07:55 PM",
        "max_temp" => 57.7,
        "mintemp_f" => 51,
        "condition" => "Sunny",
        "condition_icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        }
      )
      expect(json["data"]["attributes"]["hourly_weather"]).to contain_exactly(
        {
        "time" => "2024-04-21 00:00",
        "temperature" => 54.7,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 01:00",
        "temperature" => 54.2,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 02:00",
        "temperature" => 53.9,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 03:00",
        "temperature" => 53.7,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 04:00",
        "temperature" => 53.6,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 05:00",
        "temperature" => 53.4,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 06:00",
        "temperature" => 53.5,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 07:00",
        "temperature" => 54.4,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 08:00",
        "temperature" => 55.9,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 09:00",
        "temperature" => 58.2,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 10:00",
        "temperature" => 60.7,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 11:00",
        "temperature" => 62.9,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 12:00",
        "temperature" => 64.3,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 13:00",
        "temperature" => 65.3,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 14:00",
        "temperature" => 65.2,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 15:00",
        "temperature" => 71.1,
        "condition" => "Partly cloudy",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        },
        {
        "time" => "2024-04-21 16:00",
        "temperature" => 63.3,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 17:00",
        "temperature" => 62.3,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 18:00",
        "temperature" => 61,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 19:00",
        "temperature" => 59.5,
        "condition" => "Sunny",
        "icon" => "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        {
        "time" => "2024-04-21 20:00",
        "temperature" => 58.5,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 21:00",
        "temperature" => 57.7,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 22:00",
        "temperature" => 57,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        {
        "time" => "2024-04-21 23:00",
        "temperature" => 56.5,
        "condition" => "Clear ",
        "icon" => "//cdn.weatherapi.com/weather/64x64/night/113.png"
        }
      )
    end
  end
end
