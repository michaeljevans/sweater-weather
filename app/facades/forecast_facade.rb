class ForecastFacade
  attr_reader :location, :current_weather, :hourly_weather, :daily_weather

  def initialize(location)
    @location        = location_info(location)
    @daily_weather   = weather_next_8_days
    @hourly_weather  = weather_next_24_hours
    @current_weather = CurrentWeather.new(forecast)
  end

  def location_info(location)
    response = MapQuestService.new.get_location_information(location)
    info = response[:results].first[:locations].first
    Location.new(info)
  end

  def weather_next_24_hours
    forecast[:hourly].first(12).map do |info|
      HourlyWeather.new(info)
    end
  end

  def weather_next_8_days
    forecast[:daily].map do |info|
      DailyWeather.new(info)
    end
  end

  private

  def forecast
    @forecast ||= OpenWeatherService.new.get_forecast_information(@location.latitude, @location.longitude)
  end
end
