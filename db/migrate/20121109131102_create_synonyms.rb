class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|

      t.timestamps
    end
  end
end
