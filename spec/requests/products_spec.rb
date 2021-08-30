require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  describe 'GET /products' do
    before { get '/products' }

    it 'returns response with products and status' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns products' do
      expect(json['products']).not_to be_empty
      expect(json['products'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products/:id' do
    before { get "/products/#{product_id}" }

    it 'returns the specific product' do
      expect(json['product']).not_to be_empty
      expect(json['product']['id']).to eq(product_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
