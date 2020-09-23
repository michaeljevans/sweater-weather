class Api::V1::RoadTripController < ApplicationController
  def create
    if any_params_empty?
      render json: { error: 'Origin, destination, and API key are required fields.' }, status: 400
    elsif !api_key_valid?
      render json: { error: 'Invalid API key.' }, status: 401
    else
      road_trip = @user.road_trips.create(road_trip_params)
      facade = RoadTripFacade.new(road_trip)
      render json: RoadTripSerializer.serialize_me_captain(facade), status: 201
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

  def any_params_empty?
    input = [ params[:origin], params[:destination], params[:api_key] ]
    input.any? { |param| param.nil? || param.empty? }
  end

  def api_key_valid?
    @user ||= User.find_by(api_key: params[:api_key])
  end
end
