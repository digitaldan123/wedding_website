class AddReminderSentToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :reminder_sent, :boolean, null: false, default: false
  end
end
