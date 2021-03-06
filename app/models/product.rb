class Product < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true
  validates :description, :presence => true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/




end
