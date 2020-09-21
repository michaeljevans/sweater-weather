class MountainProjectService
  include Serviceable

  def self.get_nearby_routes(latitude, longitude)
    uri    = '/data/get-routes-for-lat-lon'

    params = {
      key: ENV['MOUNTAIN_PROJECT_API_KEY'],
      lat: latitude,
      lon: longitude,
      maxDistance: 25,
      maxResults: 10
    }

    get_and_parse(mountain_project_domain, uri, params)
  end
end
