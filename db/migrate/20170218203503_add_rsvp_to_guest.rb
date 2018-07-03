class AddRsvpToGuest < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :attending, :boolean
  end
end
