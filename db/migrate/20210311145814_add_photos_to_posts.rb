class AddPhotosToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :photos, :string
    remove_column :posts, :photo

  end
end
