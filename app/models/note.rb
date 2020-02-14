# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 1000}
end
