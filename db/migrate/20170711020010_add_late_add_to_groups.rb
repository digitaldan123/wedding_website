class AddLateAddToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :late_addition, :boolean, null: false, default: false
  end
end
