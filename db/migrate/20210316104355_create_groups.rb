class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
    drop_table :group_tables
  end
end
