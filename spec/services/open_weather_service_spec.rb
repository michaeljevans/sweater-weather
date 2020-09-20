RSpec.describe OpenWeatherService do
  scenario 'returns current, hourly, and daily weather information' do
    VCR.use_cassette('open_weather_denver_co', re_record_interval: 7.days) do
      service = OpenWeatherService.new

      latitude  = 39.738453
      longitude = -104.984853

      forecast = service.get_forecast_information(latitude, longitude)

      expect(forecast.class).to eq(Hash)
      expect(forecast).to have_key(:lat)
      expect(forecast[:lat]).to eq(latitude.round(2))
      expect(forecast).to have_key(:lon)
      expect(forecast[:lon]).to eq(longitude.round(2))
      expect(forecast).to have_key(:current)
      expect(forecast[:current]).to have_key(:dt)
      expect(forecast[:current]).to have_key(:sunrise)
      expect(forecast[:current]).to have_key(:sunset)
      expect(forecast[:current]).to have_key(:temp)
      expect(forecast[:current]).to have_key(:feels_like)
      expect(forecast[:current]).to have_key(:pressure)
      expect(forecast[:current]).to have_key(:humidity)
      expect(forecast[:current]).to have_key(:dew_point)
      expect(forecast[:current]).to have_key(:uvi)
      expect(forecast[:current]).to have_key(:clouds)
      expect(forecast[:current]).to have_key(:visibility)
      expect(forecast[:current]).to have_key(:wind_speed)
      expect(forecast[:current]).to have_key(:wind_deg)
      expect(forecast[:current]).to have_key(:weather)
      expect(forecast[:current][:weather].first).to have_key(:id)
      expect(forecast[:current][:weather].first).to have_key(:main)
      expect(forecast[:current][:weather].first).to have_key(:description)
      expect(forecast[:current][:weather].first).to have_key(:icon)

      expect(forecast).to have_key(:hourly)
      expect(forecast[:hourly].length).to eq(48)
      expect(forecast[:hourly].first).to have_key(:dt)
      expect(forecast[:hourly].first).to have_key(:temp)
      expect(forecast[:hourly].first).to have_key(:feels_like)
      expect(forecast[:hourly].first).to have_key(:pressure)
      expect(forecast[:hourly].first).to have_key(:humidity)
      expect(forecast[:hourly].first).to have_key(:dew_point)
      expect(forecast[:hourly].first).to have_key(:clouds)
      expect(forecast[:hourly].first).to have_key(:visibility)
      expect(forecast[:hourly].first).to have_key(:wind_speed)
      expect(forecast[:hourly].first).to have_key(:wind_deg)
      expect(forecast[:hourly].first).to have_key(:weather)
      expect(forecast[:hourly].first[:weather].first).to have_key(:id)
      expect(forecast[:hourly].first[:weather].first).to have_key(:main)
      expect(forecast[:hourly].first[:weather].first).to have_key(:description)
      expect(forecast[:hourly].first[:weather].first).to have_key(:icon)

      expect(forecast).to have_key(:daily)
      expect(forecast[:daily].length).to eq(8)
      expect(forecast[:daily].first).to have_key(:dt)
      expect(forecast[:daily].first).to have_key(:sunrise)
      expect(forecast[:daily].first).to have_key(:sunset)
      expect(forecast[:daily].first).to have_key(:temp)
      expect(forecast[:daily].first[:temp]).to have_key(:day)
      expect(forecast[:daily].first[:temp]).to have_key(:min)
      expect(forecast[:daily].first[:temp]).to have_key(:max)
      expect(forecast[:daily].first[:temp]).to have_key(:night)
      expect(forecast[:daily].first[:temp]).to have_key(:eve)
      expect(forecast[:daily].first[:temp]).to have_key(:morn)
      expect(forecast[:daily].first).to have_key(:feels_like)
      expect(forecast[:daily].first[:feels_like]).to have_key(:day)
      expect(forecast[:daily].first[:feels_like]).to have_key(:night)
      expect(forecast[:daily].first[:feels_like]).to have_key(:eve)
      expect(forecast[:daily].first[:feels_like]).to have_key(:morn)
      expect(forecast[:daily].first).to have_key(:pressure)
      expect(forecast[:daily].first).to have_key(:humidity)
      expect(forecast[:daily].first).to have_key(:dew_point)
      expect(forecast[:daily].first).to have_key(:wind_speed)
      expect(forecast[:daily].first).to have_key(:wind_deg)
      expect(forecast[:daily].first).to have_key(:weather)
      expect(forecast[:daily].first[:weather].first).to have_key(:id)
      expect(forecast[:daily].first[:weather].first).to have_key(:main)
      expect(forecast[:daily].first[:weather].first).to have_key(:description)
      expect(forecast[:daily].first[:weather].first).to have_key(:icon)
      expect(forecast[:daily].first).to have_key(:clouds)
      expect(forecast[:daily].first).to have_key(:pop)
      expect(forecast[:daily].first).to have_key(:uvi)
    end
  end
end