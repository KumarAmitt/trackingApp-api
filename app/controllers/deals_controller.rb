class DealsController < ApplicationController
  include CurrentUserConcern

  def index
    deals = @current_user.deals.includes(:product).newest_first

    sum_premium = deals.sum(:premium)
    items = deals.group_by { |t| t.product.product_name }
    progress = {
      sum_premium: sum_premium,
      items: items
    }

    today = deals.today
    yesterday = deals.yesterday
    previous = deals.previous

    # all = @current_user.deals.includes(:product).group_by { |t| t.created_at.day }

    render json: { today: today, yesterday: yesterday, previous: previous, progress: progress, status: :ok }
  end

  def create
    deal = @current_user.deals.build(deal_params)
    deal.user_id = @current_user.id
    if deal.save
      render json: { deal: deal }
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
