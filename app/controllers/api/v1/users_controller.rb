class Api::V1::UsersController < ApplicationController
  def create
    if any_empty_params?
      render json: { error: 'Unable to create user. All fields are required.'}, status: 400
    elsif user_already_exists?(user_params[:email])
      render json: { error: 'Unable to create user. A user with that email already exists.' }, status: 400
    elsif passwords_dont_match?(user_params[:password], user_params[:password_confirmation])
      render json: { error: 'Unable to create user. Passwords do not match.' }, status: 400
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
    input = [user_params[:email], user_params[:password], user_params[:password_confirmation]]
    input.any? { |param| param.empty? }
  end

  def user_already_exists?(email)
    User.exists?(email: email)
  end

  def passwords_dont_match?(password, password_confirmation)
    password != password_confirmation
  end
end
