class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :tag_group

      t.timestamps
    end
    add_index :tags, :tag_group_id
  end
end
