class ChangeDatatpe < ActiveRecord::Migration[6.0]
  def change
    change_column :pages, :admin_id, :integer, using: 'admin_id::integer'
  end
end
