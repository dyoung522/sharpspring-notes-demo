# frozen_string_literal: true

FactoryBot.define do
  password = Faker::Crypto.md5

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { password }
    password_confirmation { password }
  end
end
