class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.new(params[:location])
    render json: ForecastSerializer.serialize_me_captain(forecast)
  end
end
