# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
