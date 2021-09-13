require 'rails_helper'

RSpec.describe Deal, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:product) }

  it { should validate_presence_of(:premium) }
  it { should validate_presence_of(:application_id) }
end
