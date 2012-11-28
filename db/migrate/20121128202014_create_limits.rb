class CreateLimits < ActiveRecord::Migration
  def change
    create_table :limits do |t|
      t.belongs_to :item
      t.integer :quantity
      t.datetime :offer_starts_at
      t.datetime :offer_ends_at
      t.float :price
      t.belongs_to :frequency
      t.datetime :frequency_starts_at
      t.datetime :frequency_ends_at

      t.timestamps
    end
    add_index :limits, :item_id
    add_index :limits, :frequency_id
  end
end
