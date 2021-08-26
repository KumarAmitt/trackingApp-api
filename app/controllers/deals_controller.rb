class DealsController < ApplicationController
  include CurrentUserConcern

  def index
    if @current_user
      deals = @current_user.deals.includes(:product).newest_first
      all = deals.group_by { |t| t.created_at.to_date }
      progress = {
        sum_premium: deals.sum(:premium),
        items: deals.group_by { |d| d.product.product_name }
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
      render json: { status: 'Invalid data' }
    end
  end

  def update
    deal = Deal.find(params[:id]).update(deal_params)
    render json: { deal: deal }
  end

  def destroy
    deal = Deal.find(params[:id])
    deal.destroy
  end

  private

  def deal_params
    params.permit(:product_id, :premium, :application_id)
  end
end
