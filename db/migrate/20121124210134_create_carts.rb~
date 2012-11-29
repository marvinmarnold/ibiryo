class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to :shop
      t.belongs_to :user
      t.boolean :ship
      t.text :special_instructins
      t.string :currency_at_checkout
      t.string :shop_name_at_checkout
      t.float :shipping_fee
      t.float :tax
      t.float :service_fee
      t.datetime :initiated_at
      t.datetime :settled_at
      t.string :shipped_street
      t.string :shipped_room
      t.string :shipped_province
      t.string :shipped_city
      t.string :shipped_primary_phone
      t.string :shipped_secondary_phone
      t.text :shipped_directions
      t.string :billed_method
      t.string :billed_card_last_four
      t.string :billed_card_expiration
      t.string :billed_card_type
      t.string :billed_street
      t.string :billed_room
      t.string :billed_province
      t.string :billed_city

      t.timestamps
    end
    add_index :carts, :shop_id
    add_index :carts, :user_id
  end
end
