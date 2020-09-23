class RoadTripSerializer
  def self.serialize_me_captain(road_trip)
    {
      data: {
        type: 'road trip',
        id: road_trip.id,
        attributes: {
          origin: road_trip.origin,
          destination: road_trip.destination,
          travel_time: road_trip.travel_time,
          arrival_forecast: road_trip.arrival_forecast
        }
      }
    }
  end
end
