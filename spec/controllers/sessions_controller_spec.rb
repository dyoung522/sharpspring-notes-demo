# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before { @user = create(:user) }

  describe 'POST #create' do
    context 'valid login' do
      it 'returns http success' do
        post :create, params: { user: { email: @user.email, password: @user.password } }

        expect(response).to redirect_to('/')
        expect(controller.current_user).to eq @user
      end
    end

    context 'invalid login' do
      it 'returns "login incorrect"' do
        post :create, params: { user: { email: @user.email, password: nil } }

        expect(response).to redirect_to('/login')
        expect(flash[:alert]).to match(/login incorrect/i)
      end
    end
  end

  describe 'Logout' do
    it 'logs the session out' do
      session[:user_id] = @user.id
      delete :destroy

      expect(response).to redirect_to('/login')
      expect(controller.logged_in?).to be false
    end
  end
end
