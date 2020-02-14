# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 1000}

  before_validation :check_title, :check_body

  def check_title
    self.title = body.truncate(30) if title.blank? && body
  end

  def check_body
    self.body = body.truncate(1000) if body && body.length > 1000
  end
end
