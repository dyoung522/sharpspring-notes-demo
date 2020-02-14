# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title) }
  it { should validate_length_of(:body) }
end