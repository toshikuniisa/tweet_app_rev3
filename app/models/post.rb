class Post < ApplicationRecord
  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  validates:content,length: {minimum: 1,maximum: 180}
  validates:title,length: {minimum: 1,maximum: 20}
end
