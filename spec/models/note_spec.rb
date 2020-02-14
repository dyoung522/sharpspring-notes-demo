# frozen_string_literal: true

require "rails_helper"

RSpec.describe Note, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title) }
  it { should validate_length_of(:body) }

  it "uses the first 30 characters of the body for the title" do
    body = Faker::Lorem.paragraph
    note = create(:note, title: nil, body: body)
    expect(note.title).to eq body.truncate(30)
  end

  it "truncates the body to 1000 characters when over" do
    sentence_count = 10
    body = ""
    body = Faker::Lorem.paragraph(sentence_count: sentence_count += 10) until body.length > 1000

    expect(body.length).to be > 1000 # sanity check

    note = create(:note, body: body)

    expect(note.body.length).to eq 1000
  end

  it "is not valid when both title and body are empty" do
    expect(Note.new(user: create(:user))).not_to be_valid
  end
end
