# frozen_string_literal: true

class Note < ApplicationRecord
  MAX_TITLE_LENGTH = 30
  MAX_BODY_LENGTH = 1000

  belongs_to :user

  validates :title, presence: true, length: {maximum: MAX_TITLE_LENGTH}
  validates :body, length: {maximum: MAX_BODY_LENGTH}

  before_validation :check_title, :check_body

  def check_title
    self.title = title.truncate(MAX_TITLE_LENGTH) if title && title.length > MAX_TITLE_LENGTH
    self.title = body.truncate(MAX_TITLE_LENGTH) if title.blank? && body
  end

  def check_body
    self.body = body.truncate(MAX_BODY_LENGTH) if body && body.length > MAX_BODY_LENGTH
  end
end
