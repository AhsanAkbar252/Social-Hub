class AddProfilePhotoToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :profile_photo, :string
    add_column :profiles, :cover_photo, :string
  end
end
