class HourlyWeather
  attr_reader :temp, :date_time

  def initialize(weather_info)
    @temp      = weather_info[:temp]
    @date_time = weather_info[:dt]
  end
end
