class Api::V1::BackgroundImageController < ApplicationController
  def index
    background_image = ImageFacade.new(params[:location])
    render json: ImageSerializer.serialize_me_captain(background_image)
  end
end
