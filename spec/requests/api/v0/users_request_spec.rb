require 'rails_helper'

RSpec.describe 'Users API' do
  describe "happy path" do
    it "returns JSON data of new user" do
      expect { post "/api/v0/users", params: {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }}.to change(User, :count).by(1)

      expect(response).to be_successful

      json = JSON.parse(response.body)

      expect(json["data"]["attributes"]["email"]).to eq("whatever@example.com")
    end
  end
end
