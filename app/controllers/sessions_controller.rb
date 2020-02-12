# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize_user, only: [:create]

  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      redirect_to '/', status: :ok
    else
      redirect_to '/login', status: :unauthorized
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/login', status: :ok
  end
end
