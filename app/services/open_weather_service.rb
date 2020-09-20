class OpenWeatherService
  def get_forecast_information(latitude, longitude)
    response = connection.get('onecall?') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['appid']         = ENV['OPEN_WEATHER_API_KEY']
      f.params['lat']           = latitude
      f.params['lon']           = longitude
      f.params['exclude']       = 'minutely'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def url
    'https://api.openweathermap.org/data/2.5/'
  end

  def connection
    Faraday.new(url)
  end
end
