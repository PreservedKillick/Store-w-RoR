
def create_product(name, price, description)
  visit new_product_path
  fill_in 'Name', :with => name
  fill_in 'Price', :with => price
  fill_in 'Description', :with => description
  attach_file('product_image', '/Users/epicodus/Downloads/nolan.jpg')
  click_button "Create Product"
end
