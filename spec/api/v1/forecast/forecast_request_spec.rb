RSpec.describe 'Forecast API' do
  it 'returns current, hourly, and daily weather info for a given city' do
    VCR.use_cassette('forecast_denver_co', re_record_interval: 7.days) do
      location = 'denver,co'

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast.class).to eq(Hash)
      expect(forecast).to have_key(:location)
      expect(forecast[:location]).to have_key(:city)
      expect(forecast[:location][:city]).to be_a(String)
      expect(forecast[:location]).to have_key(:state)
      expect(forecast[:location][:state]).to be_a(String)
      expect(forecast[:location]).to have_key(:country)
      expect(forecast[:location][:country]).to be_a(String)

      expect(forecast).to have_key(:weather)
      expect(forecast[:weather]).to have_key(:current)
      expect(forecast[:weather][:current]).to have_key(:low)
      expect(forecast[:weather][:current][:low]).to be_a(Float)
      expect(forecast[:weather][:current]).to have_key(:high)
      expect(forecast[:weather][:current][:high]).to be_a(Float)
      expect(forecast[:weather][:current]).to have_key(:temp)
      expect(forecast[:weather][:current][:temp]).to be_a(Float)
      expect(forecast[:weather][:current]).to have_key(:sunset)
      expect(forecast[:weather][:current][:sunset]).to be_an(Integer)
      expect(forecast[:weather][:current]).to have_key(:sunrise)
      expect(forecast[:weather][:current][:sunrise]).to be_an(Integer)
      expect(forecast[:weather][:current]).to have_key(:uv_index)
      expect(forecast[:weather][:current][:uv_index]).to be_a(Float)
      expect(forecast[:weather][:current]).to have_key(:humidity)
      expect(forecast[:weather][:current][:humidity]).to be_an(Integer)
      expect(forecast[:weather][:current]).to have_key(:date_time)
      expect(forecast[:weather][:current][:date_time]).to be_an(Integer)
      expect(forecast[:weather][:current]).to have_key(:feels_like)
      expect(forecast[:weather][:current][:feels_like]).to be_a(Float)
      expect(forecast[:weather][:current]).to have_key(:visibility)
      expect(forecast[:weather][:current][:visibility]).to be_an(Integer)
      expect(forecast[:weather][:current]).to have_key(:description)
      expect(forecast[:weather][:current][:description]).to be_a(String)

      expect(forecast[:weather]).to have_key(:hourly)
      expect(forecast[:weather][:hourly].first).to have_key(:temp)
      expect(forecast[:weather][:hourly].first[:temp]).to be_a(Float)
      expect(forecast[:weather][:hourly].first).to have_key(:date_time)
      expect(forecast[:weather][:hourly].first[:date_time]).to be_an(Integer)

      expect(forecast[:weather]).to have_key(:daily)
      expect(forecast[:weather][:daily].first).to have_key(:low)
      expect(forecast[:weather][:daily].first[:low]).to be_a(Float)
      expect(forecast[:weather][:daily].first).to have_key(:high)
      expect(forecast[:weather][:daily].first[:high]).to be_a(Float)
      expect(forecast[:weather][:daily].first).to have_key(:rain_acc)
      expect(forecast[:weather][:daily].first[:rain_acc]).to be_a(Float).or eq(nil)
      expect(forecast[:weather][:daily].first).to have_key(:snow_acc)
      expect(forecast[:weather][:daily].first[:snow_acc]).to be_a(Float).or eq(nil)
      expect(forecast[:weather][:daily].first).to have_key(:date_time)
      expect(forecast[:weather][:daily].first[:date_time]).to be_an(Integer)
      expect(forecast[:weather][:daily].first).to have_key(:description)
      expect(forecast[:weather][:daily].first[:description]).to be_a(String)
    end
  end
end
