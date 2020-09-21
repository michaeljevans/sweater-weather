RSpec.describe ClimbingRoute do
  it 'exists and has attributes' do
    search_coords = '39.74968,-105.222633'
    route_info = {
      name: 'Dopey Duck',
      type: 'Trad',
      rating: '5.9',
      location: [
        'North Carolina',
        '2. Northern Mountains Region',
        'Linville Gorge',
        'Shortoff Mountain'
      ],
      longitude: -104.983582,
      latitude: 39.725582
    }

    route = ClimbingRoute.new(route_info, search_coords)

    expect(route).to be_a(ClimbingRoute)
    expect(route.name).to eq('Dopey Duck')
    expect(route.type).to eq('Trad')
    expect(route.rating).to eq('5.9')
    expect(route.location).to eq(route_info[:location])
    expect(route.distance_to_route).to eq(14.837)
  end
end
