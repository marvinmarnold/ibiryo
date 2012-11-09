class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.references :user
      t.string :thumbnail
      t.string :banner
      t.string :currency
      t.float :delivery_minimum
      t.float :delivery_fee
      t.datetime :opens_sunday_at
      t.datetime :closes_sunday_at
      t.datetime :checkin_at
      t.datetime :checkout_at
      t.boolean :is_active
      t.datetime :opens_monday_at
      t.datetime :closes_monday_at
      t.datetime :opens_tuesday_at
      t.datetime :closes_tuesday_at
      t.datetime :opens_wednesday_at
      t.datetime :closes_wednesday_at
      t.datetime :opens_thursday_at
      t.datetime :closes_thursday_at
      t.datetime :opens_friday_at
      t.datetime :closes_friday_at
      t.datetime :opens_saturday_at
      t.datetime :closes_saturday_at

      t.timestamps
    end
    add_index :shops, :user_id
  end
end
