# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_user, only: %i[create login]

  def create
    @user = User.create user_params

    if @user.valid?
      session[:user_id] = @user.id
      render root_path, status: :created
    else
      render login_path, status: :unprocessable_entity, alert: 'Invalid credentials provided'
    end
  end

  def home; end

  def login
    @user = User.new
    redirect_to root_path if logged_in?
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
