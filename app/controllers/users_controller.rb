# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.create user_params

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/', status: :created
    else
      redirect_to '/login', status: :unauthorized
    end
  end

  def login; end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
