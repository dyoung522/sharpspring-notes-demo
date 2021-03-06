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

  context "Note#search" do
    let(:user) { create :user }
    before do
      create(:note, user: user)
      create(:note, user: user, title: "lorraine's title")
      create(:note, user: user, title: "lorraine's title too", body: "lorraine's body")
      create(:note, title: "another lorraine's title")
    end

    it "only returns search results" do
      expect(Note.search("foobar").count).to eq 0
    end

    it "searches in title and body" do
      expect(Note.search("lorraine").count).to eq 3
    end

    it "performs a case-insensitive search" do
      expect(Note.search("lOrrAiNe").count).to eq 3
    end

    it "searches in title and body" do
      expect(Note.where(user: user).search("lorraine").count).to eq 2
    end
  end
end
