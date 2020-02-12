# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/', status: :ok
    else
      redirect_to '/login', status: :unauthorized
    end
  end
end
