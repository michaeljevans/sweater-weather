class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(ForecastFacade.new(params[:location]))
  end
end
