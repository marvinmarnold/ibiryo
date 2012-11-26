class CreatePossibilities < ActiveRecord::Migration
  def change
    create_table :possibilities do |t|
      t.belongs_to :option
      t.belongs_to :choice

      t.timestamps
    end
    add_index :possibilities, :option_id
    add_index :possibilities, :choice_id
  end
end
