require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before do
    post '/registrations', params: { user: { username: 'user1', password: 'asdf', password_confirmation: 'asdf' } }
  end
  describe 'POST /sessions' do
    describe 'logins the existing users' do
      it 'return the logged in user' do
        post '/sessions', params: { user: { username: 'user1', password: 'asdf' } }
        expect(json['user']['username']).to eql('user1')
      end

      it 'sets the status of created' do
        post '/sessions', params: { user: { username: 'user1', password: 'asdf' } }
        expect(json['status']).to eql('created')
      end

      it 'sets the logged_in to true' do
        post '/sessions', params: { user: { username: 'user1', password: 'asdf' } }
        expect(json['logged_in']).to be_truthy
      end
    end

    describe 'throw error in response if login is unsuccessful' do
      it 'throw the status code of 401' do
        post '/sessions', params: { user: { username: 'user2', password: 'asdf' } }
        expect(json['status']).to eql(401)
      end
    end
  end

  describe 'GET /logged_in' do
    it 'return false if user is NOT logged in' do
      get '/logged_in'
      expect(json['logged_in']).to be_falsey
    end
  end

  describe 'DELETE /logout' do
    describe 'destroys the current session' do
      it 'set the logged_out to true' do
        delete '/logout'
        expect(json['logged_out']).to be_truthy
      end
      it 'set the status to 200' do
        delete '/logout'
        expect(json['status']).to eql(200)
      end
    end
  end
end