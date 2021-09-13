FactoryBot.define do
  factory :deal do
    user { create :user }
    product { create :product }
    sequence(:application_id) { |n| "APN#{n}" }
    premium { rand * 10.round }
  end
end
