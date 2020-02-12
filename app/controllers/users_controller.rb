# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_user, only: %i[create login]

  def create
    @user = User.create user_params

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/', status: :created
    else
      redirect_to '/login', status: :unprocessable_entity
    end
  end

  def home; end

  def login
    redirect_to('/') && return if logged_in?

    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
