class ImageProduct < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, PhotoUploader
end
