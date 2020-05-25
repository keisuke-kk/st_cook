class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :menus, dependent: :destroy

  def self.search(search)
    return Category.all unless search
    Category.where('name LIKE(?)', "%#{search}%")
  end

  def self.random
    return Menu.all.shuffle.first
  end

end
