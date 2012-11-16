class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :menu_section
      t.boolean :is_active
      t.float :price

      t.timestamps
    end
    add_index :items, :menu_section_id
  end
end
