class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :type

      t.timestamps
    end
    add_index :item_types, :type
  end
end
