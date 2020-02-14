# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    user
    title { Faker::Lorem.sentence.truncate(30) }
    body { Faker::Lorem.sentence(word_count: 25).truncate(1000) }
  end
end
