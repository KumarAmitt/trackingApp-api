class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { in: 4..8 }
end
