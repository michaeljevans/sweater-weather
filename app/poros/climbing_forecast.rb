class ClimbingForecast
  def initialize(weather_info)
    @summary     = weather_info[:weather].first[:description]
    @temperature = weather_info[:temp]
  end
end
