class ClimbingRoutesFacade
  attr_reader :location, :forecast, :routes

  def initialize(location)
    @location = location
    @forecast = climbing_forecast
    @routes   = nearby_climbing_routes
  end

  def climbing_forecast
    weather = OpenWeatherService.new.get_forecast_information(latitude, longitude)
    ClimbingForecast.new(weather[:current])
  end

  def nearby_climbing_routes
    nearby = MountainProjectService.new.get_nearby_routes(latitude, longitude)
    search_coords = "#{latitude},#{longitude}"
    nearby[:routes].map { |route_info| ClimbingRoute.new(route_info, search_coords) }
  end

  private

  def location_info
    @location_info ||= MapQuestService.new.get_location_information(@location)
  end

  def latitude
    location_info[:results].first[:locations].first[:latLng][:lat]
  end

  def longitude
    location_info[:results].first[:locations].first[:latLng][:lng]
  end
end
