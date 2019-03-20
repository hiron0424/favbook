class Book < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader
end
