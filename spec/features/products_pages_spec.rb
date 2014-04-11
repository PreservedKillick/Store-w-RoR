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

  context 'editing' do
    it 'lets a user see a product page' do
      product = FactoryGirl.create(:product)
      visit product_path(product)
      page.should have_content "#{product.name}"
    end
    it "lets a user enter new information for a product" do
      product = FactoryGirl.create(:product)
      visit product_path(product)
      click_link "Edit Product"
      fill_in 'Name', :with => 'Special Chew'
      click_button "Update Product"
      page.should have_content "Special Chew"
    end
    it "won't let a user update product information to not have a product name" do
      product = FactoryGirl.create(:product)
      visit product_path(product)
      click_link "Edit Product"
      fill_in "Name", :with => ""
      click_button "Update Product"
      page.should have_content "Please fix the following:"
    end
  end

  context "deleting" do
    it 'lets a user delete a product from the store' do
      product = FactoryGirl.create(:product)
      visit product_path(product)
      click_link "Delete Product"
      page.should have_content "Product deleted"
    end
  end

  context 'go home' do
    it 'lets a user return to the products index from any page' do
      product = FactoryGirl.create(:product)
      visit edit_product_path(product)
      click_link "All Products"
      page.should have_content "Pet Toys R Us"
    end
  end
end
