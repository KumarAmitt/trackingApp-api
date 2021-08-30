require 'rails_helper'

RSpec.describe 'Deal', type: :request do
  before do
    post '/registrations', params: { user: { username: 'user1', password: 'asdf', password_confirmation: 'asdf' } }
  end

  let(:user) { User.find_by(username: 'user1') }

  before do
    product = create(:product)
    create_list(:deal, 10, user: user, product: product)
  end

  describe 'GET /deals' do
    it 'returns the deals belongs to current user' do
      deals = user.deals.includes(:product).newest_first
      expect(deals.size).to eql(10)
    end

    it 'returns status 401 if user is not logged in' do
      get '/deals'
      expect(json['status']).to eql(401)
    end
  end

  describe 'PUT /products/:product_id/deals/:id' do
    it 'updates the value of a deal' do
      last_deal = Deal.last
      id = last_deal.id
      put("/products/#{last_deal.product_id}/deals/#{id}", params: { premium: 4444 })
      updated_deal = Deal.find(id)
      expect(updated_deal.premium).to eql(4444.0)
    end
  end

  describe 'DELETE /products/:product_id/deals/:id' do
    it 'removes the deal' do
      last_deal = Deal.last
      id = last_deal.id
      delete "/products/#{last_deal.product_id}/deals/#{id}"
      deleted_deal = Deal.find_by(id: id)
      expect(deleted_deal).to eql(nil)
    end
  end
end
