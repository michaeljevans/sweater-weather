RSpec.describe Location do
  it 'exists and has attributes' do
    location_info = {
      adminArea5: 'Denver',
      adminArea3: 'CO',
      adminArea1: 'US',
      latLng: {
        lat: 39.738453,
        lng: -104.984853
      }
    }

    location = Location.new(location_info)

    expect(location).to be_a(Location)
    expect(location.city).to eq('Denver')
    expect(location.state).to eq('CO')
    expect(location.country).to eq('US')
    expect(location.latitude).to eq(39.738453)
    expect(location.longitude).to eq(-104.984853)
  end
end
