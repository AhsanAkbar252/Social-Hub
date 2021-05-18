class AddPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :likes
      t.integer :dislikes
      t.string  :description
      t.timestamps
    end
  end
end
