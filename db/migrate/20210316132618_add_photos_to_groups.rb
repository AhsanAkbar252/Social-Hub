class AddPhotosToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :photo, :string
    add_column :groups, :cover_photo, :string
  end
end
