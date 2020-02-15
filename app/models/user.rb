# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :notes, dependent: :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}

  before_save :normalize_email

  def normalize_email
    self.email = email.downcase if email
  end

  def proper_name
    name.titleize
  end
end
