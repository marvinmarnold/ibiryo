class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :cart
      t.belongs_to :item
      t.text :special_instructions
      t.integer :quantity
      t.float :unit_price_at_checkout
      t.string :name_at_checkout
      t.text :description_at_checkout
      t.datetime :booked_for

      t.timestamps
    end
    add_index :line_items, :cart_id
    add_index :line_items, :item_id
  end
end
