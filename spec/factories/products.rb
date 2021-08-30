FactoryBot.define do
  factory :product do
    product_name { Faker::Name.unique.name }
  end
end
