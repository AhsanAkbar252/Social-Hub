class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :page_name
      t.string :sub_title
      t.string :page_email
      t.integer :page_phone_no
      t.string :page_city
      t.string :page_country
      t.string :page_description
      t.string :page_facebook
      t.string :page_twitter
      t.string :page_google_plus
      t.string :page_instagram
      t.string :admin_name
      t.string :admin_id
      t.string :photo
      t.string :cover_photo
      t.boolean :privacy
      t.boolean :visibility
      t.timestamps
    end
  end
end
