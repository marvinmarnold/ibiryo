class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.belongs_to :shop
      t.float :price
      t.boolean :is_active

      t.timestamps
    end
    add_index :choices, :shop_id
  end
end
