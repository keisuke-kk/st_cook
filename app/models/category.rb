class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :menus

  def self.search(search)
    return Category.all unless search
    Category.where('name LIKE(?)', "%#{search}%")
  end
end
