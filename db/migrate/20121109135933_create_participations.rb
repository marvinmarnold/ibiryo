class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :shop
      t.belongs_to :marketing_strategy

      t.timestamps
    end
    add_index :participations, :shop_id
    add_index :participations, :marketing_strategy_id
  end
end
