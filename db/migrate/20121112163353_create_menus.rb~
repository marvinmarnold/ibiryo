class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.belongs_to :shop
      t.boolean :is_active

      t.timestamps
    end
    add_index :menus, :shop_id
  end
end
