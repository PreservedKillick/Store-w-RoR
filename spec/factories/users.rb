# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    role "MyString"
    password "MyString"
    password_confirmation { |user| user.password }
  end
end
