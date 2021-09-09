class SessionsController < ApplicationController
  include CurrentUserConcern

  # I request you to kindly read the Special Note section of the pull request(bottom of the PR)
  # I know this is not the right place to put such a note but I am just placing it here to grab your attention as
  # I already left a note regarding this action in last PR. but I guess you didn't noticed. I also sent a reply to
  # the review feedback but I guess it landed at wrong place and didn't reached to you.
  def index
    if @current_user
      render json: { status: 200, logged_in: true, username: @current_user.username }
    else
      render json: { status: 401, logged_in: false }
    end
  end

  def create
    user = User.find_by(username: user_params['username'])

    if user&.authenticate(user_params['password'])
      session[:user_id] = user.id
      render json: { status: 200, logged_in: true, username: user.username }
    else
      render json: { status: 401 }, status: 401
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
