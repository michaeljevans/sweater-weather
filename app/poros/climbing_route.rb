class ClimbingRoute
  attr_reader :name, :type, :rating, :location, :distance_to_route

  def initialize(route_info, search_coords)
    @name              = route_info[:name]
    @type              = route_info[:type]
    @rating            = route_info[:rating]
    @location          = route_info[:location]
    @distance_to_route = distance_between(route_info[:latitude], route_info[:longitude], search_coords)
  end

  def distance_between(route_lat, route_long, search_coords)
    route_coords = "#{route_lat},#{route_long}"
    result = MapQuestService.get_distance_between(route_coords, search_coords)
    result[:route][:distance]
  end
end
