class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :locale_abbr
      t.string :abbr

      t.timestamps
    end
  end
end
