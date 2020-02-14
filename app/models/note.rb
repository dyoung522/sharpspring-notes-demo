# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 1000}

  before_validation :check_title

  def check_title
    self.title = body.truncate(30) if title.blank? && body
  end
end
