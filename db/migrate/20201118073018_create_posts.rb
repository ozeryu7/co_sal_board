class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :user_id, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
