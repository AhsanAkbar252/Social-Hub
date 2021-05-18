class UpdatingRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :first_person_name
    remove_column :rooms, :second_person_name
    add_column :rooms,:first_person_id,:integer
    add_column :rooms,:second_person_id,:integer
  end
end
