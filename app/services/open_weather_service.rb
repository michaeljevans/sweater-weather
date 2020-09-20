class OpenWeatherService
  def self.get_forecast_information(latitude, longitude)
    domain = 'https://api.openweathermap.org'
    uri    = '/data/2.5/onecall'

    params = {
      appid: ENV['OPEN_WEATHER_API_KEY'],
      lat: latitude,
      lon: longitude,
      exclude: 'minutely'
    }

    response = Faraday.get("#{domain}#{uri}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params                  = params
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
