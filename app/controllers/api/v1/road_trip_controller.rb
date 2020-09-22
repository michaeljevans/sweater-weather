class Api::V1::RoadTripController < ApplicationController
  def create
    if @user
      
      render json: RoadTripSerializer.serialize_me_captain(road_trip)
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def api_key_valid?
    @user ||= User.find_by(api_key: road_trips_params[:api_key])
  end
end
