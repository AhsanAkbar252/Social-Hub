class UpdatingGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :admin_id, :integer
    add_column :groups, :privacy, :boolean
    add_column :groups, :description, :string
    add_column :groups, :visibility, :boolean
    add_column :groups, :city, :string
    add_column :groups, :country, :string
    add_column :groups, :group_rules, :string
  end
end
