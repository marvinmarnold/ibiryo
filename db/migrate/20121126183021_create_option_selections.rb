class CreateOptionSelections < ActiveRecord::Migration
  def change
    create_table :option_selections do |t|
      t.belongs_to :line_item
      t.belongs_to :option
      t.string :name_at_checkout

      t.timestamps
    end
    add_index :option_selections, :line_item_id
    add_index :option_selections, :option_id
  end
end
