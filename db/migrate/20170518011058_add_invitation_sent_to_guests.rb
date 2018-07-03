class AddInvitationSentToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :invitation_sent, :boolean, null: false, default: false
  end
end
