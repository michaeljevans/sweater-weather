class ForecastFacade
  attr_reader :location, :daily_weather, :hourly_weather, :current_weather

  def initialize(location)
    @location        = location_info(location)
    @daily_weather   = weather_next_8_days
    @hourly_weather  = weather_next_12_hours
    @current_weather = CurrentWeather.new(forecast)
  end

  private

  def forecast
    @forecast ||= OpenWeatherService.get_forecast_information(@location.latitude, @location.longitude)
  end

  def location_info(location)
    response = MapQuestService.get_location_information(location)
    Location.new(response[:results].first[:locations].first)
  end

  def weather_next_12_hours
    forecast[:hourly].first(12).map { |info| HourlyWeather.new(info) }
  end

  def weather_next_8_days
    forecast[:daily].map { |info| DailyWeather.new(info) }
  end
end
