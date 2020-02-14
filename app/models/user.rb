# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :notes, dependent: :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def proper_name
    name.titleize
  end
end
