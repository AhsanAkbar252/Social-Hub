class ChangeData < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :group_id
    remove_column :posts, :page_id
    add_column :posts, :group_id, :integer
    add_column :posts, :page_id, :integer
  end
end
