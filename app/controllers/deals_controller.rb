class DealsController < ApplicationController
  include CurrentUserConcern

  def index
    deals = @current_user.deals.includes(:product).newest_first
    data = Hash.new { |k, v| k[v] = [] }
    deals.each do |e|
      data[e.product.product_name] << e
    end

    render json: { data: data, status: :ok }
  end

  def create
    deal = @current_user.deals.build(deal_params)
    deal.product_id = params[:product_id]
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
    params.permit(:premium, :application_id)
  end
end
