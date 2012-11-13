class CreateMenuSections < ActiveRecord::Migration
  def change
    create_table :menu_sections do |t|
      t.belongs_to :menu
      t.boolean :is_active

      t.timestamps
    end
    add_index :menu_sections, :menu_id
  end
end
