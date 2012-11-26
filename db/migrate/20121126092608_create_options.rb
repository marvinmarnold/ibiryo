class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :shop
      t.integer :min_required
      t.integer :max_allowed

      t.timestamps
    end
    add_index :options, :shop_id
  end
end
