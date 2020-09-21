class ClimbingRoutesFacade
  attr_reader :location
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
    current_weather = forecast[:current]
    ClimbingForecast.new(current_weather)
  end

  def nearby_climbing_routes
    
  end

  private

  def forecast
    @forecast ||= OpenWeatherService.get_forecast_information(@location.latitude, @location.longitude)
  end
end
