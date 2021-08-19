class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :caption, presence: true,  length: { in: 1..75 }  
  validates :image, presence: true
end
