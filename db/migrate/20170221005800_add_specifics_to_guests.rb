class AddSpecificsToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :last_name, :string
    add_column :guests, :viewed_rsvp, :boolean
    add_column :guests, :street, :string
    add_column :guests, :city, :string
    add_column :guests, :state, :string
    add_column :guests, :zip, :string
  end
end
