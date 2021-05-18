class EditPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :page_id, :integer, foreign_key: true
  end
end
