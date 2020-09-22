class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.serialize_me_captain(user), status: 201
    end
  end
end
