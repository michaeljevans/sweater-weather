class MapQuestService
  def self.get_location_information(location)
    uri    = '/geocoding/v1/address'

    params = {
      key: ENV['MAPQUEST_API_KEY'],
      location: location.delete(' ')
    }

    self.get_and_parse(self.domain, uri, params)
  end

  def self.get_travel_time(origin, destination)
    uri    = '/directions/v2/route'

    params = {
      key: ENV['MAPQUEST_API_KEY'],
      from: origin.delete(' '),
      to: destination.delete(' ')
    }

    self.get_and_parse(self.domain, uri, params)
  end

  private

  def self.domain
    'http://www.mapquestapi.com'
  end

  def self.get_and_parse(domain, uri, params)
    response = Faraday.get("#{domain}#{uri}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params                  = params
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
