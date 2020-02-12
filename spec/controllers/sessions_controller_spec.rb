# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before { @user = create(:user) }

  describe 'POST #create' do
    context 'valid login' do
      it 'returns http success' do
        post :create, params: { email: @user.email, password: @user.password }

        expect(response).to have_http_status(:success)
        expect(controller.current_user).to eq @user
      end
    end

    context 'invalid login' do
      it 'returns http unauthorized' do
        post :create, params: { email: @user.email, password: nil }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'Logout' do
    it 'logs the session out' do
      session[:user_id] = @user.id
      delete :logout

      expect(response).to have_http_status(:ok)
      expect(controller.logged_in?).to be false
    end
  end
end
