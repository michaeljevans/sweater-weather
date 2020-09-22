class Api::V1::UsersController < ApplicationController
  def create
    if any_empty_params?
      render json: { error: 'Unable to create user. All fields are required.'}, status: 400
    else
      user = User.create(user_params)
      render json: UserSerializer.serialize_me_captain(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def any_empty_params?
    incoming = [user_params[:email], user_params[:password], user_params[:password_confirmation]]
    incoming.any? { |param| param.empty? }
  end
end
