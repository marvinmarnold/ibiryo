class CreateCustomizations < ActiveRecord::Migration
  def change
    create_table :customizations do |t|
      t.belongs_to :option
      t.belongs_to :item

      t.timestamps
    end
    add_index :customizations, :option_id
    add_index :customizations, :item_id
  end
end
