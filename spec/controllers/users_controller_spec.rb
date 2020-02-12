# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #login' do
    it 'returns http success' do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http created when valid' do
      post :create, params: { user: attributes_for(:user) }
      expect(response).to have_http_status(:created)
    end

    it 'returns http unauthorized when invalid' do
      post :create, params: { user: { email: 'foo@foo.co', password: nil } }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
