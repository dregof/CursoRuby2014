# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session_token do
    digest "MyString"
    token "MyString"
    secret "MyString"
  end
end
