class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image, :string
    add_column :posts, :caption, :string
  end
end
