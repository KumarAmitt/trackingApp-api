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
      get '/deals'
      expect(json.size).to eql(3)
    end

    it 'returns status 401 if user is not logged in' do
      delete '/sessions'
      get '/deals'
      expect(json['status']).to eql(401)
    end
  end
end
