# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    user
    title { Faker::Lorem.sentence.truncate(Note::MAX_TITLE_LENGTH) }
    body { Faker::Lorem.paragraph_by_chars(number: Note::MAX_BODY_LENGTH).truncate(Note::MAX_BODY_LENGTH) }
  end
end
