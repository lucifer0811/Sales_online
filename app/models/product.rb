class Product < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
