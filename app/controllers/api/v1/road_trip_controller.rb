class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user
      
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
