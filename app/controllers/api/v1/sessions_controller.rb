class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: { error: 'Email does not match any existing records.' }, status: 404
    elsif !user.authenticate(params[:password])
      render json: { error: 'Request denied. Password does not match.' }, status: 401
    else
      session[:user_id] = user.id
      render json: UserSerializer.serialize_me_captain(user), status: 201
    end
  end
end
