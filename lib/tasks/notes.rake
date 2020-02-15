# frozen_string_literal: true

if ENV["RAILS_ENV"] != "production"
  require "faker"

  namespace :notes do
    desc "Creates samples notes for demonstration"
    task create_demo: :environment do
      user = User.first
      10.times do
        Note.create(user: user, title: Faker::Movies::StarWars.quote, body: Faker::Quote.yoda)
      end
    end
  end
end
