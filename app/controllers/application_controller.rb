# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authorize_user

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id]) unless session[:user_id].nil?
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize_user
    redirect_to "/login" unless logged_in?
  end
end
