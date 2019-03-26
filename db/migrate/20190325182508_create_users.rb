class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :location
      t.string :pet_name
      t.integer :pet_age
      t.text :pet_bio
      t.string :pet_pic

      t.timestamps
    end
  end
end
