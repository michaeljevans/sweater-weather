RSpec.describe 'Forecast API' do
  it 'returns current, hourly, and daily weather info for a given city' do
    VCR.use_cassette('forecast_denver_co', re_record_interval: 7.days) do
      location = 'denver,co'

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      payload = JSON.parse(response.body, symbolize_names: true)

      expect(payload.class).to eq(Hash)
      expect(payload).to have_key(:data)

      forecast = payload[:data]

      expect(forecast).to have_key(:id)
      expect(forecast[:id]).to eq(nil)
      expect(forecast).to have_key(:type)
      expect(forecast[:type]).to eq('forecast')

      expect(forecast[:forecast]).to have_key(:location)
      expect(forecast[:forecast][:location]).to have_key(:city)
      expect(forecast[:forecast][:location][:city]).to be_a(String)
      expect(forecast[:forecast][:location]).to have_key(:state)
      expect(forecast[:forecast][:location][:state]).to be_a(String)
      expect(forecast[:forecast][:location]).to have_key(:country)
      expect(forecast[:forecast][:location][:country]).to be_a(String)

      expect(forecast[:forecast]).to have_key(:weather)
      expect(forecast[:forecast][:weather]).to have_key(:current)
      expect(forecast[:forecast][:weather][:current]).to have_key(:low)
      expect(forecast[:forecast][:weather][:current][:low]).to be_a(Float)
      expect(forecast[:forecast][:weather][:current]).to have_key(:high)
      expect(forecast[:forecast][:weather][:current][:high]).to be_a(Float)
      expect(forecast[:forecast][:weather][:current]).to have_key(:temp)
      expect(forecast[:forecast][:weather][:current][:temp]).to be_a(Float)
      expect(forecast[:forecast][:weather][:current]).to have_key(:sunset)
      expect(forecast[:forecast][:weather][:current][:sunset]).to be_an(Integer)
      expect(forecast[:forecast][:weather][:current]).to have_key(:sunrise)
      expect(forecast[:forecast][:weather][:current][:sunrise]).to be_an(Integer)
      expect(forecast[:forecast][:weather][:current]).to have_key(:uv_index)
      expect(forecast[:forecast][:weather][:current][:uv_index]).to be_a(Float)
      expect(forecast[:forecast][:weather][:current]).to have_key(:humidity)
      expect(forecast[:forecast][:weather][:current][:humidity]).to be_an(Integer)
      expect(forecast[:forecast][:weather][:current]).to have_key(:date_time)
      expect(forecast[:forecast][:weather][:current][:date_time]).to be_an(Integer)
      expect(forecast[:forecast][:weather][:current]).to have_key(:feels_like)
      expect(forecast[:forecast][:weather][:current][:feels_like]).to be_a(Float)
      expect(forecast[:forecast][:weather][:current]).to have_key(:visibility)
      expect(forecast[:forecast][:weather][:current][:visibility]).to be_an(Integer)
      expect(forecast[:forecast][:weather][:current]).to have_key(:description)
      expect(forecast[:forecast][:weather][:current][:description]).to be_a(String)
      expect(forecast[:forecast][:weather]).to_not have_key(:pressure)
      expect(forecast[:forecast][:weather]).to_not have_key(:dew_point)
      expect(forecast[:forecast][:weather]).to_not have_key(:clouds)
      expect(forecast[:forecast][:weather]).to_not have_key(:wind_speed)
      expect(forecast[:forecast][:weather]).to_not have_key(:wind_deg)


      expect(forecast[:forecast][:weather]).to have_key(:hourly)
      expect(forecast[:forecast][:weather][:hourly].length).to eq(12)
      expect(forecast[:forecast][:weather][:hourly].first).to have_key(:temp)
      expect(forecast[:forecast][:weather][:hourly].first[:temp]).to be_a(Float)
      expect(forecast[:forecast][:weather][:hourly].first).to have_key(:date_time)
      expect(forecast[:forecast][:weather][:hourly].first[:date_time]).to be_an(Integer)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:feels_like)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:pressure)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:humidity)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:dew_point)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:clouds)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:visibility)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:wind_speed)
      expect(forecast[:forecast][:weather][:hourly].first).to_not have_key(:wind_deg)

      expect(forecast[:forecast][:weather]).to have_key(:daily)
      expect(forecast[:forecast][:weather][:daily].length).to eq(8)
      expect(forecast[:forecast][:weather][:daily].first).to have_key(:low)
      expect(forecast[:forecast][:weather][:daily].first[:low]).to be_a(Float)
      expect(forecast[:forecast][:weather][:daily].first).to have_key(:high)
      expect(forecast[:forecast][:weather][:daily].first[:high]).to be_a(Float)
      expect(forecast[:forecast][:weather][:daily].first).to have_key(:rain_acc)
      expect(forecast[:forecast][:weather][:daily].first[:rain_acc]).to be_a(Float).or eq(nil)
      expect(forecast[:forecast][:weather][:daily].first).to have_key(:snow_acc)
      expect(forecast[:forecast][:weather][:daily].first[:snow_acc]).to be_a(Float).or eq(nil)
      expect(forecast[:forecast][:weather][:daily].first).to have_key(:date_time)
      expect(forecast[:forecast][:weather][:daily].first[:date_time]).to be_an(Integer)
      expect(forecast[:forecast][:weather][:daily].first).to have_key(:description)
      expect(forecast[:forecast][:weather][:daily].first[:description]).to be_a(String)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:sunrise)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:sunset)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:feels_like)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:pressure)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:humidity)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:dew_point)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:wind_speed)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:wind_deg)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:clouds)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:pop)
      expect(forecast[:forecast][:weather][:daily].first).to_not have_key(:uvi)
    end
  end
end
