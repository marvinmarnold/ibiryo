class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :thumbnail
      t.string :banner
      t.belongs_to :currency
      t.float :delivery_minimum
      t.float :delivery_fee
      t.time :opens_sunday_at
      t.time :closes_sunday_at
      t.time :checkin_at
      t.time :checkout_at
      t.boolean :is_active
      t.time :opens_monday_at
      t.time :closes_monday_at
      t.time :opens_tuesday_at
      t.time :closes_tuesday_at
      t.time :opens_wednesday_at
      t.time :closes_wednesday_at
      t.time :opens_thursday_at
      t.time :closes_thursday_at
      t.time :opens_friday_at
      t.time :closes_friday_at
      t.time :opens_saturday_at
      t.time :closes_saturday_at

      t.timestamps
    end
    add_index :shops, :currency_id
  end
end
