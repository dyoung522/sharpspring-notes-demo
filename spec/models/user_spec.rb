# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it "returns the name in title case" do
    expect(build_stubbed(:user, name: "fred rodgers").proper_name).to eq "Fred Rodgers"
  end
end
