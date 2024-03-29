class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.belongs_to :shop
      t.belongs_to :item_type
      t.boolean :is_active

      t.timestamps
    end
    add_index :menus, :shop_id
    add_index :menus, :item_type_id
  end
end
