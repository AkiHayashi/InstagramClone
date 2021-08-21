class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :caption, presence: true,  length: { in: 1..75 }  
  validates :image, presence: true
end
