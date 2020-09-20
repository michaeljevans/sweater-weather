class ForecastSerializer
  def self.serialize_me_captain(forecast)
    {
      location: forecast.location.as_json,
      weather: {
        current: forecast.current_weather.as_json,
        hourly: forecast.hourly_weather.map { |hour| hour.as_json },
        daily: forecast.daily_weather.map { |day| day.as_json }
      }
    }
  end
end
