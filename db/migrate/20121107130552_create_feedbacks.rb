class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.text :body
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :subject
      t.string :ip

      t.timestamps
    end
    add_index :feedbacks, :user_id
  end
end
