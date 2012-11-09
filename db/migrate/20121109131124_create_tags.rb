class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.belongs_to :synonym

      t.timestamps
    end
    add_index :tags, :synonym_id
  end
end
