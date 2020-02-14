# frozen_string_literal: true

require "rails_helper"

RSpec.describe Note, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title) }
  it { should validate_length_of(:body) }

  it "uses the first #{Note::MAX_TITLE_LENGTH} characters of the body for the title" do
    body = Faker::Lorem.paragraph
    note = create(:note, title: nil, body: body)
    expect(note.title).to eq body.truncate(Note::MAX_TITLE_LENGTH)
  end

  it "truncates the title to #{Note::MAX_TITLE_LENGTH} characters" do
    title = Faker::Lorem.characters(number: 50)
    expect(title.length).to be > Note::MAX_TITLE_LENGTH # sanity check

    note = create(:note, title: title)

    expect(note.title.length).to eq Note::MAX_TITLE_LENGTH
  end

  it "truncates the body to #{Note::MAX_BODY_LENGTH} characters" do
    sentence_count = 10
    body = ""
    body = Faker::Lorem.paragraph(sentence_count: sentence_count += 10) until body.length > Note::MAX_BODY_LENGTH

    expect(body.length).to be > Note::MAX_BODY_LENGTH # sanity check

    note = create(:note, body: body)

    expect(note.body.length).to eq Note::MAX_BODY_LENGTH
  end

  it "is not valid when both title and body are empty" do
    expect(Note.new(user: create(:user))).not_to be_valid
  end
end
