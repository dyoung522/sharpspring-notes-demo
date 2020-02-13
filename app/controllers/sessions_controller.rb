# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize_user, only: [:create]

  def create
    user = User.find_by(email: params[:user][:email])&.authenticate(params[:user][:password])

    if user
      session[:user_id] = user.id
      redirect_back(fallback_location: root_path)
    else
      redirect_to login_path, alert: 'Login Incorrect'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You have been successfully logged out'
  end
end
