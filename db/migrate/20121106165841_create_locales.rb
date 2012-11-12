class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.string :language
      t.string :abbr

      t.timestamps
    end
  end
end
