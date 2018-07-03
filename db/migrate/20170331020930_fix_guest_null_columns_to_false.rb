class FixGuestNullColumnsToFalse < ActiveRecord::Migration[5.0]
  def change
      change_column_default :guests, :day_before, from: nil, to: false
      change_column_null :guests, :day_before, false, false
      change_column_default :guests, :day_after, from: nil, to: false
      change_column_null :guests, :day_after, false, false
      change_column_default :guests, :attending, from: nil, to: false
      change_column_null :guests, :attending, false, false
      change_column_default :guests, :viewed_rsvp, from: nil, to: false
      change_column_null :guests, :viewed_rsvp, false, false
      change_column_default :guests, :rsvp_sent, from: nil, to: false
      change_column_null :guests, :rsvp_sent, false, false
  end
end
