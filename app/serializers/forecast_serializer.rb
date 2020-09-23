class ForecastSerializer
  def self.serialize_me_captain(forecast)
    {
      data: {
        type: 'forecast',
        id: nil,
        attributes: {
          location: forecast.location,
          weather: {
            current: forecast.current_weather,
            hourly: forecast.hourly_weather.map { |hour| hour },
            daily: forecast.daily_weather.map { |day| day }
          }
        }
      }
    }
  end
end
