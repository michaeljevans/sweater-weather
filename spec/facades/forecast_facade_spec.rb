RSpec.describe ForecastFacade do
  it 'exists and has attributes' do
    VCR.use_cassette('forecast_denver_co', re_record_interval: 7.days) do
      location = 'denver,co'

      forecast = ForecastFacade.new(location)

      expect(forecast).to be_a(ForecastFacade)

      expect(forecast.location).to be_a(Location)
      expect(forecast.location.city).to eq('Denver')
      expect(forecast.location.state).to eq('CO')
      expect(forecast.location.country).to eq('US')
      expect(forecast.location.latitude).to be_a(Float)
      expect(forecast.location.longitude).to be_a(Float)

      expect(forecast.daily_weather.length).to eq(8)
      expect(forecast.daily_weather.first).to be_a(DailyWeather)
      expect(forecast.daily_weather.first.low).to be_a(Float)
      expect(forecast.daily_weather.first.high).to be_a(Float)
      expect(forecast.daily_weather.first.date_time).to be_an(Integer)
      expect(forecast.daily_weather.first.description).to be_a(String)

      expect(forecast.hourly_weather.length).to eq(12)
      expect(forecast.hourly_weather.first).to be_an(HourlyWeather)
      expect(forecast.hourly_weather.first.temp).to be_a(Float)
      expect(forecast.hourly_weather.first.date_time).to be_an(Integer)

      expect(forecast.current_weather).to be_a(CurrentWeather)
      expect(forecast.current_weather.low).to be_a(Float)
      expect(forecast.current_weather.high).to be_a(Float)
      expect(forecast.current_weather.temp).to be_a(Float)
      expect(forecast.current_weather.sunset).to be_an(Integer)
      expect(forecast.current_weather.sunrise).to be_an(Integer)
      expect(forecast.current_weather.uv_index).to be_a(Float)
      expect(forecast.current_weather.humidity).to be_an(Integer)
      expect(forecast.current_weather.date_time).to be_an(Integer)
      expect(forecast.current_weather.feels_like).to be_a(Float)
      expect(forecast.current_weather.visibility).to be_an(Integer)
      expect(forecast.current_weather.description).to be_a(String)
    end
  end
end
