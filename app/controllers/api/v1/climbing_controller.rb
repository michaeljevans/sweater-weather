class Api::V1::ClimbingController < ApplicationController
  def index
    climbing_routes = ClimbingRoutesFacade.new(params[:location])
    render json: ClimbingRoutesSerializer.new(climbing_routes)
  end
end
