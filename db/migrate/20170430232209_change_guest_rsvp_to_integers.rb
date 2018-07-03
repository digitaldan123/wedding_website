class ChangeGuestRsvpToIntegers < ActiveRecord::Migration[5.0]
  def self.up
    change_column_default :guests, :attending, nil
    change_column :guests, :attending, :integer, using: 'case when attending then 2 else 0 end', default: 0, null: false
    change_column_default :guests, :day_before, nil
    change_column :guests, :day_before, :integer,using: 'case when day_before then 2 else 0 end', default: 0, null: false
    change_column_default :guests, :day_after, nil
    change_column :guests, :day_after, :integer, using: 'case when day_after then 2 else 0 end', default: 0, null: false
  end

  def self.down
    change_column_default :guests, :attending, nil
    change_column :guests, :attending, :boolean, default: false, null: false, using: "case when attending=2 then true else false end"
    change_column_default :guests, :day_before, nil
    change_column :guests, :day_before, :boolean, default: false, null: false, using: 'cast(day_before as boolean)'
    change_column_default :guests, :day_after, nil
    change_column :guests, :day_after, :boolean, default: false, null: false, using: 'day_after::boolean'
  end
end
