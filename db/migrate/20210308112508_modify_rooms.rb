class ModifyRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms,:first_person_name,:string
    add_column :rooms,:second_person_name,:string
  end
end
