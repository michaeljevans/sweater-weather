RSpec.describe ClimbingRoute do
  it 'exists and has attributes' do
    VCR.use_cassette('climbing_routes_golden_co', re_record_interval: 7.days) do
      search_coords = '39.74968,-105.222633'

      route = ClimbingRoute.new(route_info, search_coords)

      expect(route).to be_a(ClimbingRoute)
      expect(route.name).to be_a(String)
      expect(route.type).to be_a(String)
      expect(route.rating).to be_a(String)
      expect(route.location).to be_an(Array)
      route.location.each do |location_info|
        expect(location_info).to be_a(String)
      end
      expect(route.distance_to_route).to be_a(Float)
    end
  end
end
