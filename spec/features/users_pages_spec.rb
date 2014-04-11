require 'spec_helper'

describe 'User' do

  it 'allows a user to sign in' do
    visit '/sessions/new'
    fill_in 'Name', :with  => "Michael"
    fill_in 'Password', :with => "password"
    click_button 'Log In'
    page.should have_content "Logged in"
  end

end
