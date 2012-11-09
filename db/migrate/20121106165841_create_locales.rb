class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.string :language
      t.string :abbr
      t.boolean :is_default, default: false

      t.timestamps
    end
  end
end
