class CreateChoiceSelections < ActiveRecord::Migration
  def change
    create_table :choice_selections do |t|
      t.belongs_to :option_selection
      t.belongs_to :choice
      t.float :price_at_checkout
      t.string :name_at_checkout

      t.timestamps
    end
    add_index :choice_selections, :option_selection_id
    add_index :choice_selections, :choice_id
  end
end
