RSpec.describe ClimbingRoutesFacade do
  it 'exists and has attributes' do
    VCR.use_cassette('climbing_routes_golden_co', re_record_interval: 7.days) do
      location = 'golden,co'

      climbing_routes = ClimbingRoutesFacade.new(location)

      expect(climbing_routes).to be_a(ClimbingRoutesFacade)
      expect(climbing_routes.location).to eq(location)
      expect(climbing_routes.forecast).to be_a(ClimbingForecast)
      expect(climbing_routes.forecast.summary).to be_a(String)
      expect(climbing_routes.forecast.temperature).to be_a(Float)
      expect(climbing_routes.routes.first).to be_a(ClimbingRoute)
      expect(climbing_routes.routes.first.name).to be_a(String)
      expect(climbing_routes.routes.first.type).to be_a(String)
      expect(climbing_routes.routes.first.rating).to be_a(String)
      expect(climbing_routes.routes.first.location).to be_an(Array)
      climbing_routes.routes.first.location.each do |loc_info|
        expect(loc_info).to be_a(String)
      end
      expect(climbing_routes.routes.first.distance_to_route).to be_a(Float)
    end
  end
end
