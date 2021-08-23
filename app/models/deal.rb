class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :premium, presence: true
  validates :application_id, presence: true

  scope :newest_first, -> { order('created_at DESC') }
end
