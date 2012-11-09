class CreateMarketingStrategies < ActiveRecord::Migration
  def change
    create_table :marketing_strategies do |t|
      t.string  :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
