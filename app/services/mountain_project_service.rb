class MountainProjectService
  def self.get_nearby_routes(latitude, longitude)
    domain = 'https://www.mountainproject.com'
    uri    = '/data/get-routes-for-lat-lon'

    params = {
      key: ENV['MOUNTAIN_PROJECT_API_KEY'],
      lat: latitude,
      lon: longitude,
      maxDistance: 25,
      maxResults: 10
    }

    response = Faraday.get("#{domain}#{uri}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params                  = params
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
