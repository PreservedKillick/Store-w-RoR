require 'spec_helper'

describe 'Product' do

  context 'creating' do
    it 'lets the user view the New Product page' do
      visit root_url
      page.should have_content 'New Product'
      click_on 'New Product'
      page.should have_content 'Add your product.'
    end
    it 'lets the user add a new product' do
      create_product('hedgehog', 4.99, 'chew toy')
      page.should have_content "Product Added to Store"
    end
    it 'does not let the user add a new product without a name' do
      create_product('', 4.99, 'chew toy')
      page.should have_content "Name can't be blank"
    end
    it 'does not let the user create a product with a duplicate name' do
      FactoryGirl.create(:product)
      create_product('MyString', 4.99, 'chew toy')
      page.should have_content "Name has already been taken"
    end
  end

end
