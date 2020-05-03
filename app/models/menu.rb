class Menu < ApplicationRecord
  validates :title, :detail, presence: true
  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader
end
