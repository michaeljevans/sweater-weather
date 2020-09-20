class DailyWeather
  attr_reader :low,
              :high,
              :rain_acc,
              :snow_acc,
              :date_time,
              :description

  def initialize(weather_info)
    @low         = weather_info[:temp][:min]
    @high        = weather_info[:temp][:max]
    @rain_acc    = weather_info[:rain]
    @snow_acc    = weather_info[:snow]
    @date_time   = weather_info[:dt]
    @description = weather_info[:weather].first[:description]
  end
end
