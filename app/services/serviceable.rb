module Serviceable
  def map_quest_domain
    'http://www.mapquestapi.com'
  end

  def open_weather_domain
    'https://api.openweathermap.org'
  end

  def mountain_project_domain
    'https://www.mountainproject.com'
  end

  def get_and_parse(domain, uri, params)
    response = Faraday.get("#{domain}#{uri}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params                  = params
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
