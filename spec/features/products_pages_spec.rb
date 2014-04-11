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
      product = FactoryGirl.build(:product)
      visit new_product_path
      fill_in 'Name', :with => product.name
      fill_in 'Price', :with => product.price
      fill_in 'Description', :with => product.description
      attach_file('product_image', '/Users/epicodus/Downloads/nolan.jpg')
      click_button "Create Product"
      page.should have_content "Product Added to Store"
    end
    it 'does not let the user add a new product withou a name' do
      product = FactoryGirl.build(:product)
      visit new_product_path
      fill_in 'Price', :with => product.price
      fill_in 'Description', :with => product.description
      attach_file('product_image', '/Users/epicodus/Downloads/nolan.jpg')
      click_button "Create Product"
      page.should have_content "Name can't be blank"
    end
    it 'does not let the user create a product with a duplicate name' do
      FactoryGirl.create(:product)
      product = FactoryGirl.build(:bad_product)
      visit new_product_path
      fill_in 'Name', :with => product.name
      fill_in 'Price', :with => product.price
      fill_in 'Description', :with => product.description
      attach_file('product_image', '/Users/epicodus/Downloads/nolan.jpg')
      click_button "Create Product"
      page.should have_content "Name has already been taken"
    end
  end

end
