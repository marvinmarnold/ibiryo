class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.belongs_to :locale
      t.string :name
      t.belongs_to :describable, polymorphic: true
      t.text :body

      t.timestamps
    end
    add_index :descriptions, :locale_id
    add_index :descriptions, [:describable_id, :describable_type]
  end
end
