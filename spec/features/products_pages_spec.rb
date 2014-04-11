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
  end

end
