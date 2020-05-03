class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :title
      t.text :detail
      t.string :image
      t.integer :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
