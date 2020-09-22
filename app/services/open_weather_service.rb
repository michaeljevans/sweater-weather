require_relative 'serviceable'

class OpenWeatherService
  include Serviceable

  def get_forecast_information(latitude, longitude)
    uri    = '/data/2.5/onecall'

    params = {
      appid: ENV['OPEN_WEATHER_API_KEY'],
      lat: latitude,
      lon: longitude,
      exclude: 'minutely'
    }

    get_and_parse(open_weather_domain, uri, params)
  end
end
