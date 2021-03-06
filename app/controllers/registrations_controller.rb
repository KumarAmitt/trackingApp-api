class RegistrationsController < ApplicationController
  def create
    user = User.create(user_params)

    if user.id
      session[:user_id] = user.id
      render json: { status: 200, logged_in: true, username: user.username }
    else
      render json: { status: 500 }, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
