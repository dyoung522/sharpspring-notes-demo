# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = create :user }

  it 'Should be a valid user' do
    expect(@user.valid?).to eq true
    expect(User.last.password_digest.nil?).to be false
  end
end
