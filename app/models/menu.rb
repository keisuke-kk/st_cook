class Menu < ApplicationRecord
  validates :title, :detail, presence: true
  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Menu.all unless search
    Menu.where('title LIKE(?)', "%#{search}%")
  end

  def self.random
    # menu = Menu.offset( rand(Menu.count) ).first
    # redirect_to url: category_menu_path(menu.category_id, menu.id)
    # category = Category.all.shuffle.first
    # menu = category.menus.shuffle.first
    # redirect_to category_menu_path(menu.category_id, menu.id)
  end
end
