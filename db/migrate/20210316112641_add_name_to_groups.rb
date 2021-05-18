class AddNameToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups,:group_name,:string
    add_column :groups,:admin_name,:string
  end
end
