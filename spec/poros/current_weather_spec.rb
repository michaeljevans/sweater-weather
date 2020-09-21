RSpec.describe CurrentWeather do
  it 'exists and has attributes' do
    current_info = {
      current: {
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
      },
      daily: [
        {
          temp: {
            min: 289.27,
            max: 303.14
          }
        }
      ]
    }

    current = CurrentWeather.new(current_info)

    expect(current).to be_a(CurrentWeather)
    expect(current.low).to eq(289.27)
    expect(current.high).to eq(303.14)
    expect(current.temp).to eq(289.27)
    expect(current.sunset).to eq(1600650010)
    expect(current.sunrise).to eq(1600605971)
    expect(current.uv_index).to eq(6.76)
    expect(current.humidity).to eq(41)
    expect(current.date_time).to eq(1600590486)
    expect(current.feels_like).to eq(285.92)
    expect(current.visibility).to eq(10000)
    expect(current.description).to eq('scattered clouds')
  end
end
