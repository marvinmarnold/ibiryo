class CreateTagGroups < ActiveRecord::Migration
  def change
    create_table :tag_groups do |t|
      t.belongs_to :item_type
      t.timestamps
    end
    add_index :tag_groups, :item_type_id
  end
end
