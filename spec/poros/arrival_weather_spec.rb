RSpec.describe ArrivalWeather do
  it 'exists and has attributes' do
    weather_info = {
      temp: 287.25,
      weather: [
        description: 'scattered clouds'
      ]
    }

    arrival_weather = ArrivalWeather.new(weather_info)

    expect(arrival_weather).to be_an(ArrivalWeather)
    expect(arrival_weather.temp).to be_a(Float)
    expect(arrival_weather.temp).to eq(287.25)
    expect(arrival_weather.description).to be_a(String)
    expect(arrival_weather.description).to eq('scattered clouds')
  end
end
