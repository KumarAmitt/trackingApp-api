class DealsController < ApplicationController
  include CurrentUserConcern

  def index
    deals = @current_user.deals.includes(:product).newest_first
    # data = Hash.new { |k, v| k[v] = [] }
    # deals.each do |e|
    #   data[e.product.product_name] << e
    # end

    today = deals.today
    yesterday = deals.yesterday
    previous = deals.previous

    # all = @current_user.deals.includes(:product).group_by { |t| t.created_at.day }

    render json: { today: previous, yesterday: yesterday, previous: previous, status: :ok }
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
