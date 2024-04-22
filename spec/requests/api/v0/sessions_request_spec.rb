require 'rails_helper'

RSpec.describe 'Sessions API' do
  describe "happy path" do
    it "returns JSON data of existing user who logging in" do
      user = User.create(email: "whatever@example.com", password: "password")

      post "/api/v0/sessions", params: {
        "email": "whatever@example.com",
        "password": "password"
      }

      expect(response).to be_successful

      json = JSON.parse(response.body)
      expect(json).to match(
        {
          "data" => {
            "type" => "users",
            "id" => user.id,
            "attributes" => {
              "email" => "whatever@example.com",
              "api_key" => user.auth_token
            }
          }
        }
      )
    end
  end
end
