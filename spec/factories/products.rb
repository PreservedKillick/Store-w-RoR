# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    price 1.5
    description "MyText"

    factory :bad_product do
      price 3.5
      description "lorem ipsum"
    end
  end

end
