require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before do
    post '/registrations', params: { user: { username: 'user1', password: 'asdf', password_confirmation: 'asdf' } }
  end
  describe 'POST /sessions' do
    describe 'logins the existing users' do
      it 'return the logged in user' do
        post '/sessions', params: { user: { username: 'user1', password: 'asdf' } }
        expect(json['username']).to eql('user1')
      end

      it 'sets the status of created' do
        post '/sessions', params: { user: { username: 'user1', password: 'asdf' } }
        expect(json['status']).to eql(200)
      end

      it 'sets the logged_in to true' do
        post '/sessions', params: { user: { username: 'user1', password: 'asdf' } }
        expect(json['logged_in']).to be_truthy
      end
    end
  end

  describe 'DELETE /sessions' do
    describe 'destroys the current session' do
      it 'set the logged_in to false' do
        delete '/sessions'
        expect(json['logged_out']).to be_falsy
      end
      it 'set the status to 200' do
        delete '/sessions'
        expect(json['status']).to eql(200)
      end
    end
  end
end
