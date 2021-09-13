class User < ApplicationRecord
  has_secure_password
  has_many :deals, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..8 }
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
