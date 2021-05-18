class AddVideosToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :videos, :string
  end
end
