class MapQuestService
  def self.get_location_information(location)
    domain = 'http://www.mapquestapi.com'
    uri    = '/geocoding/v1/address'

    params = {
      key: ENV['MAPQUEST_API_KEY'],
      location: location.delete(' ')
    }

    response = Faraday.get("#{domain}#{uri}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params                  = params
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_travel_time(origin, destination)
    domain = 'http://www.mapquestapi.com'
    uri    = '/directions/v2/route'

    params = {
      key: ENV['MAPQUEST_API_KEY'],
      from: origin,
      to: destination
    }

    response = Faraday.get("#{domain}#{uri}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params                  = params
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
