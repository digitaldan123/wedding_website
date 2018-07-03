class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :num_of_guests_allowed
      t.boolean :day_before_invite
      t.boolean :day_after_invite

      t.timestamps
    end
  end
end
