require 'spec_helper'

describe 'User' do

  it 'allows a user to sign in' do
    owner = FactoryGirl.create(:owner)
    visit '/sessions/new'
    fill_in 'Name', :with  => owner.name
    fill_in 'Password', :with => owner.password
    click_button 'Log In'
    page.should have_content "Logged in"
  end

end
