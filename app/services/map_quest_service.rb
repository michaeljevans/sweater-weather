class MapQuestService
  include Serviceable

  def self.get_location_information(location)
    uri    = '/geocoding/v1/address'

    params = {
      key: ENV['MAPQUEST_API_KEY'],
      location: location
    }

    get_and_parse(map_quest_domain, uri, params)
  end

  def self.get_distance_between(location_1, location_2)
    uri    = '/directions/v2/route'

    params = {
      key: ENV['MAPQUEST_API_KEY'],
      from: location_1,
      to: location_2
    }

    get_and_parse(map_quest_domain, uri, params)
  end
end
