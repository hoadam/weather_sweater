require 'rails_helper'

RSpec.describe Weather::Astro do
  describe '.from_json' do
    it 'creates a new Astro instance from a JSON hash' do
      json = { sunrise: '6:00 AM', sunset: '6:00 PM' }
      astro = Weather::Astro.from_json(json)

      expect(astro.sunrise).to eq(json[:sunrise])
      expect(astro.sunset).to eq(json[:sunset])
    end
  end
end
