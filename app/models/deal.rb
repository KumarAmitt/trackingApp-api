class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :premium, presence: true
  validates :application_id, presence: true

  scope :newest_first, -> { order('created_at DESC') }
  scope :group_by_date, -> { group_by { |items| items.created_at.to_date } }
  scope :group_by_product, -> { group_by { |items| items.product.product_name } }

  scope :deals, -> { deals.includes(:product).newest_first }
  scope :sum_premium, -> { sum(:premium) }

end
