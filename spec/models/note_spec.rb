# frozen_string_literal: true

require "rails_helper"

RSpec.describe Note, type: :model do
  let(:user) { create(:user) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title) }
  it { should validate_length_of(:body) }

  it "uses the first 30 characters of the body for the title" do
    body = Faker::Lorem.paragraph(sentence_count: 10)
    note = Note.create(body: body, user: user)
    expect(note.title).to eq body.truncate(30)
  end

  it "is not valid when both title and body are empty" do
    expect(Note.new(user: user)).not_to be_valid
  end
end
