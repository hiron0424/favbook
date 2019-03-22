class Book < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader
end