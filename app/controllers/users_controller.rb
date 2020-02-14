# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_user, only: %i[create login]

  def create
    if User.find_by(email: params[:user][:email].downcase)
      redirect_to login_url, alert: "User already exists, please log in"
      return
    end

    @user = User.create user_params

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to login_url(register: true), alert: "Invalid Credentials Provided"
    end
  end

  def login
    if logged_in?
      redirect_to root_url
      return
    end

    @user = User.new
    @login_form = params[:register].to_s.downcase == "true" ? "registration_form" : "login_form"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
