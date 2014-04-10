# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :category do
    sequence(:name) { "Cat#{rand(1000)}"}
    key "books"
  end

  factory :category_music do
    name "Music"
    key "music"
  end

  factory :invalid_category do
    name "Falla"
    key "ABC"
  end

end
