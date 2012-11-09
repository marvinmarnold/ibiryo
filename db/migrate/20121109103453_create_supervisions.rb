class CreateSupervisions < ActiveRecord::Migration
  def change
    create_table :supervisions do |t|
      t.belongs_to :salesmanager
      t.belongs_to :salesperson

      t.timestamps
    end
    add_index :supervisions, :salesmanager_id
    add_index :supervisions, :salesperson_id
  end
end
