class ClimbingRoutesFacade
  attr_reader :location, :forecast, :routes

  def initialize(location)
    @location = location_info(location)
    @forecast = climbing_forecast
    @routes   = nearby_climbing_routes
  end

  def location_info(location)
    response = MapQuestService.get_location_information(location)
    info = response[:results].first[:locations].first
    Location.new(info)
  end

  def climbing_forecast
    weather = OpenWeatherService.get_forecast_information(@location.latitude, @location.longitude)
    ClimbingForecast.new(weather[:current])
  end

  def nearby_climbing_routes
    response = MountainProjectService.get_nearby_routes(@location.latitude, @location.longitude)
    response[:routes].map { |route_info| ClimbingRoute.new(route_info, search_location) }
  end

  def search_location
    "#{@location.latitude},#{@location.longitude}"
  end
end
