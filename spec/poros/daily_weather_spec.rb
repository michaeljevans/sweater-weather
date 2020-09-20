RSpec.describe DailyWeather do
  it 'exists and has attributes' do
    day_info = {
      dt: 1600624800,
      temp: {
        min: 289.27,
        max: 303.14
      },
      weather: [
        {
          description: 'scattered clouds'
        }
      ]
    }

    day = DailyWeather.new(day_info)

    expect(day).to be_a(DailyWeather)
    expect(day.low).to eq(289.27)
    expect(day.high).to eq(303.14)
    expect(day.rain_acc).to eq(nil)
    expect(day.snow_acc).to eq(nil)
    expect(day.date_time).to eq(1600624800)
    expect(day.description).to eq('scattered clouds')

  end

  it 'can have rain/snow attributes when the data is available' do
    day_info = {
      dt: 1600624800,
      temp: {
        min: 289.27,
        max: 303.14
      },
      rain: 6.7,
      snow: 10.1,
      weather: [
        {
          description: 'scattered clouds'
        }
      ]
    }

    day = DailyWeather.new(day_info)

    expect(day.rain_acc).to eq(6.7)
    expect(day.snow_acc).to eq(10.1)
  end
end
