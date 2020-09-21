RSpec.describe ClimbingForecast do
  it 'exists and has attributes' do
    current_weather = {
      dt: 1600590486,
      sunrise: 1600605971,
      sunset: 1600650010,
      temp: 289.27,
      feels_like: 285.92,
      humidity: 41,
      uvi: 6.76,
      visibility: 10000,
      weather: [
        {
          description: 'scattered clouds'
        }
      ]
    }

    forecast = ClimbingForecast.new(current_weather)

    expect(forecast).to be_a(ClimbingForecast)
    expect(forecast.summary).to eq('scattered clouds')
    expect(forecast.temperature).to eq(289.27)
  end
end
