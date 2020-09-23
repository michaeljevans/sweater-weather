class Api::V1::BackgroundImageController < ApplicationController
  def index
    background_image = ImageFacade.new(image_params[:location])
    render json: ImageSerializer.serialize_me_captain(background_image)
  end

  private

  def image_params
    params.permit(:location)
  end
end
