require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:deals).dependent(:destroy) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_length_of(:username).is_at_least(4).is_at_most(8) }

  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
end
