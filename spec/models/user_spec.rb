require 'spec_helper'

describe User do
  it { should have_secure_password }

  it { should validate_presence_of :name }
  it 'should check for duplicates' do
    FactoryGirl.create(:user)
    should validate_uniqueness_of :name
  end
  it { should validate_presence_of :role }
end
