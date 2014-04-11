class User < ActiveRecord::Base

  has_secure_password

  validates :name, :presence => true, :uniqueness => true

  validates :role, :presence => true
end
