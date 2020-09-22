class ClimbingRoute
  attr_reader :name, :type, :rating, :location, :distance_to_route

  def initialize(route_info, search_coords)
    @name              = route_info[:name]
    @type              = route_info[:type]
    @rating            = route_info[:rating]
    @location          = route_info[:location]
    @latitude          = route_info[:latitude]
    @longitude         = route_info[:longitude]
    @distance_to_route = distance_between(route_coords, search_coords)
  end

  def distance_between(route_coords, search_coords)
    result = MapQuestService.new.get_distance_between(route_coords, search_coords)
    result[:route][:distance]
  end

  def route_coords
    "#{@latitude},#{@longitude}"
  end
end
