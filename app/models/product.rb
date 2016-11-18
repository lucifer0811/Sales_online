class Product < ActiveRecord::Base
  has_many :comments
  has_many :image_products, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  accepts_nested_attributes_for :image_products, allow_destroy: true
end
