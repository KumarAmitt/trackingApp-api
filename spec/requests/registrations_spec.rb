require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    post '/registrations', params: { user: { username: 'user1', password: 'asdf', password_confirmation: 'asdf' } }
  end
  describe 'POST /registrations' do
    it 'creates a new user' do
      user = User.last
      expect(user.username).to eql('user1')
    end

    it 'sets the status of created' do
      expect(json['status']).to eql('created')
    end
  end
end
