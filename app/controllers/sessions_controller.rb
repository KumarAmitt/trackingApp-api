class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    if @current_user
      render json: { status: 200, logged_in: true, username: @current_user.username }
    else
      user = User.find_by(username: user_params['username'])

      if user&.authenticate(user_params['password'])
        session[:user_id] = user.id
        render json: { status: 200, logged_in: true, username: user.username }
      else
        render json: { status: 401 }, status: 401
      end
    end
  end

  def destroy
    reset_session
    render json: { status: 200, logged_in: false }
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
