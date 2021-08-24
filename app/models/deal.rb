class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :premium, presence: true
  validates :application_id, presence: true

  scope :newest_first, -> { order('created_at DESC') }
  scope :today, -> { where('created_at::date = ?', Time.zone.now.beginning_of_day) }
  scope :yesterday, -> { where('created_at::date = ?', Date.yesterday) }
  scope :previous, -> { where('created_at::date != ? AND created_at::date != ?', :today, :yesterday) }
end
