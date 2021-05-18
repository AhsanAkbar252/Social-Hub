class AddProfile < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :phone_no
      t.integer :Dob_day
      t.string :Dob_month
      t.integer :Dob_year
      t.string :gender
      t.string :city
      t.string :country
      t.string :about_me
      t.string :university
      t.string :qualification
      t.string :university_start
      t.string :university_end
      t.string :university_city
      t.string :university_country
      t.string :profession
      t.string :workplace
      t.string :workplace_city
      t.string :workplace_country
      t.string :interests
      t.string :skills
      t.string :languages
      t.timestamps
    end
  end
end
