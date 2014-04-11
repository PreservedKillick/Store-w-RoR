class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :role, :presence => true
end
