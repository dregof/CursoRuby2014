# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Ruby"
    description "Un libro"
    price 10
    stock 10
    sequence(:reference) { |i| 1000+i }

    association :category

    factory :product_sin_stock do
      stock 0
    end
  end
end
