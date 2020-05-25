class Menu < ApplicationRecord

  validates :title, :detail, presence: true
  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Menu.all unless search
    Menu.where('title LIKE(?)', "%#{search}%")
  end

end
