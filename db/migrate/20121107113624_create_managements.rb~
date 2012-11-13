class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.references :user
      t.references :shop
      t.string :type

      t.timestamps
    end
    add_index :managements, :user_id
    add_index :managements, :shop_id
  end
end
