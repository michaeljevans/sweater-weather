RSpec.describe HourlyWeather do
  it 'exists and has attributes' do
    hour_info = {
      temp: 297.79,
      dt: 1600704000
    }

    hourly = HourlyWeather.new(hour_info)

    expect(hourly).to be_a(HourlyWeather)
    expect(hourly.temp).to eq(297.79)
    expect(hourly.date_time).to eq(1600704000)
  end
end
