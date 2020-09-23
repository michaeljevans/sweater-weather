RSpec.describe 'Forecast API' do
  it 'returns current, hourly, and daily weather info for a given city' do
    VCR.use_cassette('forecast_denver_co', re_record_interval: 7.days) do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      location = 'denver,co'

      get "/api/v1/forecast?location=#{location}", headers: headers

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed.class).to eq(Hash)
      expect(parsed).to have_key(:data)

      forecast = parsed[:data]

      expect(forecast).to have_key(:id)
      expect(forecast[:id]).to eq(nil)
      expect(forecast).to have_key(:type)
      expect(forecast[:type]).to eq('forecast')

      expect(forecast).to have_key(:attributes)
      expect(forecast[:attributes]).to have_key(:location)
      expect(forecast[:attributes][:location]).to have_key(:city)
      expect(forecast[:attributes][:location][:city]).to be_a(String)
      expect(forecast[:attributes][:location]).to have_key(:state)
      expect(forecast[:attributes][:location][:state]).to be_a(String)
      expect(forecast[:attributes][:location]).to have_key(:country)
      expect(forecast[:attributes][:location][:country]).to be_a(String)

      expect(forecast[:attributes]).to have_key(:weather)
      expect(forecast[:attributes][:weather]).to have_key(:current)
      expect(forecast[:attributes][:weather][:current]).to have_key(:low)
      expect(forecast[:attributes][:weather][:current][:low]).to be_a(Float)
      expect(forecast[:attributes][:weather][:current]).to have_key(:high)
      expect(forecast[:attributes][:weather][:current][:high]).to be_a(Float)
      expect(forecast[:attributes][:weather][:current]).to have_key(:temp)
      expect(forecast[:attributes][:weather][:current][:temp]).to be_a(Float)
      expect(forecast[:attributes][:weather][:current]).to have_key(:sunset)
      expect(forecast[:attributes][:weather][:current][:sunset]).to be_an(Integer)
      expect(forecast[:attributes][:weather][:current]).to have_key(:sunrise)
      expect(forecast[:attributes][:weather][:current][:sunrise]).to be_an(Integer)
      expect(forecast[:attributes][:weather][:current]).to have_key(:uv_index)
      expect(forecast[:attributes][:weather][:current][:uv_index]).to be_a(Float)
      expect(forecast[:attributes][:weather][:current]).to have_key(:humidity)
      expect(forecast[:attributes][:weather][:current][:humidity]).to be_an(Integer)
      expect(forecast[:attributes][:weather][:current]).to have_key(:date_time)
      expect(forecast[:attributes][:weather][:current][:date_time]).to be_an(Integer)
      expect(forecast[:attributes][:weather][:current]).to have_key(:feels_like)
      expect(forecast[:attributes][:weather][:current][:feels_like]).to be_a(Float)
      expect(forecast[:attributes][:weather][:current]).to have_key(:visibility)
      expect(forecast[:attributes][:weather][:current][:visibility]).to be_an(Integer)
      expect(forecast[:attributes][:weather][:current]).to have_key(:description)
      expect(forecast[:attributes][:weather][:current][:description]).to be_a(String)
      expect(forecast[:attributes][:weather]).to_not have_key(:pressure)
      expect(forecast[:attributes][:weather]).to_not have_key(:dew_point)
      expect(forecast[:attributes][:weather]).to_not have_key(:clouds)
      expect(forecast[:attributes][:weather]).to_not have_key(:wind_speed)
      expect(forecast[:attributes][:weather]).to_not have_key(:wind_deg)


      expect(forecast[:attributes][:weather]).to have_key(:hourly)
      expect(forecast[:attributes][:weather][:hourly].length).to eq(12)
      expect(forecast[:attributes][:weather][:hourly].first).to have_key(:temp)
      expect(forecast[:attributes][:weather][:hourly].first[:temp]).to be_a(Float)
      expect(forecast[:attributes][:weather][:hourly].first).to have_key(:date_time)
      expect(forecast[:attributes][:weather][:hourly].first[:date_time]).to be_an(Integer)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:feels_like)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:pressure)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:humidity)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:dew_point)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:clouds)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:visibility)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:wind_speed)
      expect(forecast[:attributes][:weather][:hourly].first).to_not have_key(:wind_deg)

      expect(forecast[:attributes][:weather]).to have_key(:daily)
      expect(forecast[:attributes][:weather][:daily].length).to eq(8)
      expect(forecast[:attributes][:weather][:daily].first).to have_key(:low)
      expect(forecast[:attributes][:weather][:daily].first[:low]).to be_a(Float)
      expect(forecast[:attributes][:weather][:daily].first).to have_key(:high)
      expect(forecast[:attributes][:weather][:daily].first[:high]).to be_a(Float)
      expect(forecast[:attributes][:weather][:daily].first).to have_key(:rain_acc)
      expect(forecast[:attributes][:weather][:daily].first[:rain_acc]).to be_a(Float).or eq(nil)
      expect(forecast[:attributes][:weather][:daily].first).to have_key(:snow_acc)
      expect(forecast[:attributes][:weather][:daily].first[:snow_acc]).to be_a(Float).or eq(nil)
      expect(forecast[:attributes][:weather][:daily].first).to have_key(:date_time)
      expect(forecast[:attributes][:weather][:daily].first[:date_time]).to be_an(Integer)
      expect(forecast[:attributes][:weather][:daily].first).to have_key(:description)
      expect(forecast[:attributes][:weather][:daily].first[:description]).to be_a(String)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:sunrise)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:sunset)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:feels_like)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:pressure)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:humidity)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:dew_point)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:wind_speed)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:wind_deg)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:clouds)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:pop)
      expect(forecast[:attributes][:weather][:daily].first).to_not have_key(:uvi)
    end
  end

  it 'cannot return a forecast without a location' do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    get "/api/v1/forecast", headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Forecast cannot be retrieved without a location.')
  end

  it 'cannot return a forecast with an empty location' do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    location = ''

    get "/api/v1/forecast?location=#{location}", headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Forecast cannot be retrieved without a location.')
  end
end
