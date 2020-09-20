RSpec.describe 'Forecast API' do
  xit 'returns current, hourly, and daily weather info for a given city' do
    VCR.use_cassette('forecast_denver_co', re_record_interval: 7.days) do
      location = 'denver,co'

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast.class).to eq(Hash)
    end
  end
end
