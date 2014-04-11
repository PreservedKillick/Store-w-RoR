# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    role "MyString"
    password "password"
    password_confirmation { |user| user.password }
  end
  factory :owner, :class => User do
    name "Michael"
    role "owner"
    password "password"
    password_confirmation "password"
  end
end
