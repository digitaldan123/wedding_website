class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.boolean :day_before
      t.boolean :day_after
      t.integer :food
      t.text :dietary_restrictions
      t.text :address
      t.string :auth_token
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
