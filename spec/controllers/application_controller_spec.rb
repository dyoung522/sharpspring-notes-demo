# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  before { @user = create(:user) }

  context 'when not logged in' do
    it 'should not set current_user' do
      expect(controller.current_user).to be nil
    end

    it 'should not be logged_in' do
      expect(controller.logged_in?).to be false
    end
  end

  context 'when logged in' do
    before { session[:user_id] = @user.id }

    it 'should set current_user' do
      expect(controller.current_user).to eq @user
    end

    it 'should be logged_in' do
      expect(controller.logged_in?).to be true
    end
  end
end
