class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :menus

  def self.search(search)
    return Category.all unless search
    Category.where('name LIKE(?)', "%#{search}%")
  end

  # def self.random
  #   category = Category.all.shuffle.first
  #   menu = category.menus.shuffle.first
  #   redirect_to category_menu_path(menu.category_id, menu.id)
  # end

end
