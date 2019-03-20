class Book < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader
end
