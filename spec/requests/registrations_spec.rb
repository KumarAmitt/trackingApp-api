require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /registrations' do
    it 'creates a new user' do
      post '/registrations', params: { user: { username: 'user1', password: 'asdf', password_confirmation: 'asdf' } }
      user = User.last
      expect(user.username).to eql('user1')
    end
  end
end
