class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if any_empty_params?
      render json: { error: 'Email and password are required fields.' }, status: 400
    elsif user.nil?
      render json: { error: 'Email does not match any existing records.' }, status: 404
    elsif !user.authenticate(user_params[:password])
      render json: { error: 'Request denied. Password does not match.' }, status: 401
    else
      session[:user_id] = user.id
      render json: UserSerializer.serialize_me_captain(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def any_empty_params?
    input = [user_params[:email], user_params[:password]]
    input.any? { |param| param.empty? }
  end
end
