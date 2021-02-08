class AddShoesColorToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :shoes_color, :string
    add_column :posts, :shirts_color, :string
    add_column :posts, :date, :date
  end
end
