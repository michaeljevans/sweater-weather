class CurrentWeather
  attr_reader :low,
              :high,
              :temp,
              :sunset,
              :sunrise,
              :uv_index,
              :humidity,
              :date_time,
              :feels_like,
              :visibility,
              :description

  def initialize(weather_info)
    @low         = weather_info[:daily].first[:temp][:min]
    @high        = weather_info[:daily].first[:temp][:max]
    @temp        = weather_info[:current][:temp]
    @sunset      = weather_info[:current][:sunset]
    @sunrise     = weather_info[:current][:sunrise]
    @uv_index    = weather_info[:current][:uvi]
    @humidity    = weather_info[:current][:humidity]
    @date_time   = weather_info[:current][:dt]
    @feels_like  = weather_info[:current][:feels_like]
    @visibility  = weather_info[:current][:visibility]
    @description = weather_info[:current][:weather].first[:description]
  end
end
