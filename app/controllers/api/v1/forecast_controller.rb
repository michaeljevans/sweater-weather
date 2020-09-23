class Api::V1::ForecastController < ApplicationController
  def show
    if no_location?
      render json: { error: 'Forecast cannot be retrieved without a location.' }, status: 400
    else
      forecast = ForecastFacade.new(params[:location])
      render json: ForecastSerializer.serialize_me_captain(forecast)
    end
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def no_location?
    forecast_params[:location].nil? || forecast_params[:location].empty?
  end
end
