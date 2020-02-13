# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    title { Faker::Quote.yoda.truncate(30) }
    body { Faker::Quote.matz.truncate(1000) }
    user { create(:user) }
  end
end
