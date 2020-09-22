class SessionsController < ApplicationController
  def create
    user = User.find_by(params[:email])
    render json: UserSerializer.serialize_me_captain(user)
  end
end
