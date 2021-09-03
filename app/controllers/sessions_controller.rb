class SessionsController < ApplicationController
  include CurrentUserConcern

  def index
    if @current_user
      render json: { logged_in: true, username: @current_user.username }
    else
      render json: { logged_in: false }
    end
  end

  def create
    user = User.find_by(username: user_params['username']).try(:authenticate, user_params['password'])

    if user
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, username: user.username }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    reset_session
    render json: { status: 200, logged_out: true }
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
