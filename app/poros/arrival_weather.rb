class ArrivalWeather
  attr_reader :temp, :description

  def initialize(weather_info)
    @temp        = weather_info[:temp]
    @description = weather_info[:weather].first[:description]
  end
end
