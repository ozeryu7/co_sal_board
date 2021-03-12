class CreateMetoos < ActiveRecord::Migration[6.0]
  def change
    create_table :Metoos do |t|

      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end