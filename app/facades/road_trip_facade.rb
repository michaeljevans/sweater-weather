class RoadTripFacade
  attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast

  def initialize(id, road_trip_info)
    @id               = id
    @origin           = road_trip_info[:origin]
    @destination      = road_trip_info[:destination]
    @travel_time      = time_to_destination
    @arrival_forecast = weather_at_destination
  end

  private

  def time_to_destination
    @info ||= MapQuestService.get_travel_time(@origin, @destination)
    (@info[:route][:time] / 60).round
  end

  def weather_at_destination
    @weather ||= OpenWeatherService.get_forecast_information(location.latitude, location.longitude)
    arrival_time = (time_to_destination / 60).round
    arrival_weather = @weather[:hourly][arrival_time]
    ArrivalWeather.new(arrival_weather)
  end

  def location
    @location_info ||= MapQuestService.get_location_information(@destination)
    Location.new(@location_info[:results].first[:locations].first)
  end
end
