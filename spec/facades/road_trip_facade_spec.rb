RSpec.describe RoadTripFacade do
  it 'exists and has attributes' do
    VCR.use_cassette('road_trip_denver_to_vegas', re_record_interval: 7.days) do
      id = 2
      road_trip_info = {
        origin: 'denver, co',
        destination: 'las vegas, nv'
      }

      road_trip = RoadTripFacade.new(id, road_trip_info)

      expect(road_trip).to be_a(RoadTripFacade)
      expect(road_trip.id).to eq(id)
      expect(road_trip.origin).to eq(road_trip_info[:origin])
      expect(road_trip.destination).to eq(road_trip_info[:destination])
      expect(road_trip.travel_time).to be_an(Integer)
      expect(road_trip.arrival_forecast).to be_an(ArrivalWeather)
      expect(road_trip.arrival_forecast.temp).to be_a(Float)
      expect(road_trip.arrival_forecast.description).to be_a(String)
    end
  end
end
