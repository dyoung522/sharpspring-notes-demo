# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before { @user = create(:user) }

  describe 'POST #create' do
    context 'valid login' do
      it 'returns http success' do
        post :create, params: { email: @user.email, password: @user.password }
        expect(response).to have_http_status(:success)
      end
    end

    context 'invalid login' do
      it 'returns http unauthorized' do
        post :create, params: { email: @user.email, password: nil }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
