class AddGroupToPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :post_id
    add_column :posts, :group_id, :integer, foreign_key: true
  end
end
