class Api::V1::RoadTripController < ApplicationController
  def create
    if api_key_valid?
      road_trip = @user.road_trips.create(road_trip_params)
      facade = RoadTripFacade.new(road_trip.id, road_trip_params)
      render json: RoadTripSerializer.serialize_me_captain(facade), status: 201
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

  def api_key_valid?
    @user ||= User.find_by(api_key: params[:api_key])
  end
end
