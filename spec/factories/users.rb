FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password { 'asdf' }
    password_confirmation { 'asdf' }
  end
end
