class AddRsvpAndKidsToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :rsvp_sent, :boolean
    add_column :guests, :is_under_twelve, :boolean
  end
end
