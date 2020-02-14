# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end

    it "redirects to home page when already logged in" do
      session[:user_id] = user.id
      get :login

      expect(response).to redirect_to("/")
    end
  end

  describe "POST #create" do
    it "redirects to the login page when user exists" do
      session[:user_id] = user.id
      post :create, params: {user: user.attributes}

      expect(response).to redirect_to("/login")
      expect(flash[:alert]).to match(/user.*exists.*log in/i)
    end

    it "redirects to the home page when valid" do
      post :create, params: {user: attributes_for(:user)}
      expect(response).to redirect_to("/")
    end

    it "redirects back to the registration page when invalid" do
      post :create, params: {user: {email: "foo@foo.co", password: nil}}
      expect(response).to redirect_to("/login?register=true")
      expect(flash[:alert]).to match(/invalid credentials/i)
    end
  end
end
