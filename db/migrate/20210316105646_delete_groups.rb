class DeleteGroups < ActiveRecord::Migration[6.0]
  def change
    drop_table :groups
    create_table :groups do |t|
      t.references :post , foreign_key: true
      t.timestamps
    end
  end
end
