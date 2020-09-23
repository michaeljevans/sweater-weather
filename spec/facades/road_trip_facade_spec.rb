RSpec.describe RoadTripFacade do
  it 'exists and has attributes' do
    VCR.use_cassette('road_trip_denver_to_vegas', re_record_interval: 7.days) do
      user = User.create!(email: 'whatever@example.com', password: 'password')

      road_trip_info = {
        origin: 'denver, co',
        destination: 'las vegas, nv'
      }

      road_trip = user.road_trips.create(road_trip_info)

      facade = RoadTripFacade.new(road_trip)

      expect(facade).to be_a(RoadTripFacade)
      expect(facade.id).to eq(road_trip.id)
      expect(facade.origin).to eq(road_trip.origin)
      expect(facade.destination).to eq(road_trip.destination)
      expect(facade.travel_time).to be_an(Integer)
      expect(facade.arrival_forecast).to be_an(ArrivalWeather)
      expect(facade.arrival_forecast.temp).to be_a(Float)
      expect(facade.arrival_forecast.description).to be_a(String)
    end
  end
end
