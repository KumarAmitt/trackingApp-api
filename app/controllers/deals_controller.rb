class DealsController < ApplicationController
  include CurrentUserConcern

  def index
    if @current_user
      all = @current_user.deals.newest_first.group_by_date
      progress = {
        sum_premium: @current_user.deals.sum_premium,
        items: @current_user.deals.group_by_product
      }
      render json: { all: all, progress: progress, status: :ok }
    else
      render json: { status: 401 }
    end
  end

  def create
    deal = @current_user.deals.build(deal_params)
    deal.user_id = @current_user.id
    if deal.save
      render json: { deal: deal, status: :ok }
    else
      render json: { status: 'Invalid data' }, status: 400
    end
  end

  private

  def deal_params
    params.permit(:product_id, :premium, :application_id)
  end
end
